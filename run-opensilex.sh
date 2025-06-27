#!/bin/bash
# OpenSILEX Management Script
# Usage: ./run-opensilex.sh [command]
# Modified to work with current user installation

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration - Auto-detect current user and paths
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo ~$CURRENT_USER)
OPENSILEX_USER="$CURRENT_USER"
OPENSILEX_SERVICE="opensilex"
OPENSILEX_DIR="$USER_HOME/opensilex/bin"
CONFIG_FILE="$USER_HOME/opensilex/config/opensilex.yml"
LOG_DIR="$USER_HOME/opensilex/logs"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "This script should not be run as root"
        exit 1
    fi
}

# Function to check if OpenSILEX installation exists
check_opensilex_installation() {
    if [ ! -d "$OPENSILEX_DIR" ]; then
        print_error "OpenSILEX installation not found in '$OPENSILEX_DIR'"
        print_error "Please run the setup script first"
        exit 1
    fi
    
    if [ ! -f "$OPENSILEX_DIR/opensilex.sh" ]; then
        print_error "OpenSILEX script not found in '$OPENSILEX_DIR'"
        exit 1
    fi
    
    if [ ! -f "$CONFIG_FILE" ]; then
        print_error "OpenSILEX configuration not found at '$CONFIG_FILE'"
        exit 1
    fi
}

# Function to check Docker containers
check_containers() {
    print_status "Checking Docker containers..."
    
    # Check MongoDB
    if docker ps | grep -q mongo_opensilex; then
        print_success "MongoDB container is running"
    else
        print_warning "MongoDB container is not running"
        return 1
    fi
    
    # Check RDF4J
    if docker ps | grep -q rdf4j_opensilex; then
        print_success "RDF4J container is running"
    else
        print_warning "RDF4J container is not running"
        return 1
    fi
    
    return 0
}

# Function to start Docker containers
start_containers() {
    print_status "Starting Docker containers..."
    
    # Start MongoDB if not running
    if ! docker ps | grep -q mongo_opensilex; then
        if docker ps -a | grep -q mongo_opensilex; then
            print_status "Starting existing MongoDB container..."
            docker start mongo_opensilex
        else
            print_status "Creating and starting MongoDB container..."
            docker network create mongoCluster 2>/dev/null || true
            docker run -d --restart unless-stopped -p 27017:27017 --name mongo_opensilex --network mongoCluster mongo:5 mongod --replSet opensilex --bind_ip localhost,mongo_opensilex
            sleep 10
            docker exec mongo_opensilex mongosh --eval "rs.initiate({_id: 'opensilex', members: [{_id: 0, host: 'mongo_opensilex:27017'}]})" 2>/dev/null || true
        fi
    fi
    
    # Start RDF4J if not running
    if ! docker ps | grep -q rdf4j_opensilex; then
        if docker ps -a | grep -q rdf4j_opensilex; then
            print_status "Starting existing RDF4J container..."
            docker start rdf4j_opensilex
        else
            print_status "Creating and starting RDF4J container..."
            docker run -d --restart unless-stopped -p 8080:8080 --name rdf4j_opensilex \
                -e JAVA_OPTS="-Xms2g -Xmx2g" \
                -v rdf4j_data:/var/rdf4j \
                -v rdf4j_logs:/usr/local/tomcat/logs \
                eclipse/rdf4j-workbench:5.0.3
        fi
    fi
    
    print_success "Docker containers started"
}

# Function to stop Docker containers
stop_containers() {
    print_status "Stopping Docker containers..."
    
    if docker ps | grep -q mongo_opensilex; then
        docker stop mongo_opensilex
        print_success "MongoDB container stopped"
    fi
    
    if docker ps | grep -q rdf4j_opensilex; then
        docker stop rdf4j_opensilex
        print_success "RDF4J container stopped"
    fi
}

# Function to start OpenSILEX service
start_service() {
    print_status "Starting OpenSILEX service..."
    
    # Start containers first
    start_containers
    
    # Wait a moment for containers to be ready
    sleep 5
    
    # Start OpenSILEX service
    sudo systemctl start $OPENSILEX_SERVICE
    sleep 3
    
    if systemctl is-active --quiet $OPENSILEX_SERVICE; then
        print_success "OpenSILEX service started successfully"
        get_status
    else
        print_error "Failed to start OpenSILEX service"
        sudo systemctl status $OPENSILEX_SERVICE --no-pager
        exit 1
    fi
}

# Function to stop OpenSILEX service
stop_service() {
    print_status "Stopping OpenSILEX service..."
    
    sudo systemctl stop $OPENSILEX_SERVICE
    
    if systemctl is-active --quiet $OPENSILEX_SERVICE; then
        print_error "Failed to stop OpenSILEX service"
        exit 1
    else
        print_success "OpenSILEX service stopped"
    fi
}

# Function to restart OpenSILEX service
restart_service() {
    print_status "Restarting OpenSILEX service..."
    stop_service
    sleep 3
    start_service
}

# Function to get service status
get_status() {
    print_status "OpenSILEX Status:"
    echo ""
    
    # Service status
    echo "=== Service Status ==="
    if systemctl is-active --quiet $OPENSILEX_SERVICE; then
        print_success "OpenSILEX service is running"
    else
        print_warning "OpenSILEX service is not running"
    fi
    
    echo ""
    echo "=== Container Status ==="
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" --filter name=mongo_opensilex --filter name=rdf4j_opensilex
    
    echo ""
    echo "=== Network Access ==="
    PUBLIC_IP=$(curl -s http://checkip.amazonaws.com/ 2>/dev/null || echo "Unable to get public IP")
    echo "Public IP: $PUBLIC_IP"
    echo "OpenSILEX URL: http://$PUBLIC_IP/"
    echo "Direct access: http://$PUBLIC_IP:28081"
    echo "RDF4J Workbench: http://$PUBLIC_IP:8080/rdf4j-workbench"
    
    echo ""
    echo "=== Port Status ==="
    ss -tlnp | grep -E ':80|:8080|:27017|:28081' || echo "No OpenSILEX-related ports listening"
}

# Function to view logs
view_logs() {
    local log_type="${1:-service}"
    
    case $log_type in
        "service"|"systemd")
            print_status "Viewing OpenSILEX service logs (Ctrl+C to exit)..."
            sudo journalctl -u $OPENSILEX_SERVICE -f
            ;;
        "app"|"application")
            print_status "Viewing OpenSILEX application logs..."
            if [ -d "$LOG_DIR" ]; then
                ls -la "$LOG_DIR"/
                echo ""
                read -p "Enter log file name (or press Enter for latest): " log_file
                if [ -z "$log_file" ]; then
                    log_file=$(ls -t "$LOG_DIR"/*.log 2>/dev/null | head -1)
                else
                    log_file="$LOG_DIR/$log_file"
                fi
                
                if [ -f "$log_file" ]; then
                    tail -f "$log_file"
                else
                    print_error "Log file not found: $log_file"
                fi
            else
                print_error "Log directory not found: $LOG_DIR"
            fi
            ;;
        "docker")
            echo "Available containers:"
            docker ps --format "table {{.Names}}\t{{.Status}}" --filter name=mongo_opensilex --filter name=rdf4j_opensilex
            echo ""
            read -p "Enter container name: " container_name
            if [ -n "$container_name" ]; then
                docker logs -f "$container_name"
            fi
            ;;
        *)
            print_error "Unknown log type: $log_type"
            echo "Available types: service, app, docker"
            ;;
    esac
}

# Function to initialize OpenSILEX
initialize_opensilex() {
    print_status "Initializing OpenSILEX..."
    
    # Check installation first
    check_opensilex_installation
    
    # Check if containers are running
    if ! check_containers; then
        print_status "Starting containers first..."
        start_containers
        sleep 10
    fi
    
    # Initialize as current user (no sudo -u needed since we're already the right user)
    print_status "Running system install..."
    cd "$OPENSILEX_DIR"
    source ~/.bashrc 2>/dev/null || true
    ./opensilex.sh system install
    
    print_status "Creating default admin user..."
    ./opensilex.sh user add --admin
    
    print_success "OpenSILEX initialization completed"
    print_status "Default credentials: admin@opensilex.org / admin"
    print_warning "Please change the default password after first login!"
}

# Function to run OpenSILEX commands
run_command() {
    local cmd="$*"
    print_status "Running OpenSILEX command: $cmd"
    
    # Check installation first
    check_opensilex_installation
    
    cd "$OPENSILEX_DIR"
    source ~/.bashrc 2>/dev/null || true
    ./opensilex.sh $cmd
}

# Function to show help
show_help() {
    echo "OpenSILEX Management Script"
    echo ""
    echo "Current user: $CURRENT_USER"
    echo "OpenSILEX directory: $OPENSILEX_DIR"
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  start           Start OpenSILEX service and containers"
    echo "  stop            Stop OpenSILEX service"
    echo "  restart         Restart OpenSILEX service"
    echo "  status          Show service and container status"
    echo "  logs [type]     View logs (types: service, app, docker)"
    echo "  init            Initialize OpenSILEX (first time setup)"
    echo "  containers      Manage containers (start/stop/status)"
    echo "  cmd [args]      Run OpenSILEX command with arguments"
    echo "  help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 start"
    echo "  $0 logs service"
    echo "  $0 cmd user list"
    echo "  $0 cmd sparql reset-ontologies"
}

# Main script logic
main() {
    local command="${1:-help}"
    
    # Don't check root for help command
    if [ "$command" != "help" ]; then
        check_root
    fi
    
    case $command in
        "start")
            start_service
            ;;
        "stop")
            stop_service
            ;;
        "restart")
            restart_service
            ;;
        "status")
            get_status
            ;;
        "logs")
            view_logs "${2:-service}"
            ;;
        "init"|"initialize")
            initialize_opensilex
            ;;
        "containers")
            case "${2:-status}" in
                "start")
                    start_containers
                    ;;
                "stop")
                    stop_containers
                    ;;
                "status"|*)
                    check_containers
                    ;;
            esac
            ;;
        "cmd"|"command")
            shift
            run_command "$@"
            ;;
        "help"|*)
            show_help
            ;;
    esac
}

# Run main function
main "$@"