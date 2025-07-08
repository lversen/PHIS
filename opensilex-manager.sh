#!/bin/bash
# OpenSILEX Service Management Script
#
# This script provides a simple interface to manage the OpenSILEX Docker containers.
#
# Usage: ./opensilex-manager.sh [start|stop|restart|status|logs|update]

# --- Configuration ---
# Set the directory where your opensilex-docker-compose is located
COMPOSE_DIR="~/opensilex-docker-compose"
# Environment file for docker-compose
ENV_FILE="opensilex.env"

# --- Colors for Output ---
COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_NC='\033[0m' # No Color

# --- Helper Functions ---
print_success() {
    echo -e "${COLOR_GREEN}✓ $1${COLOR_NC}"
}

print_error() {
    echo -e "${COLOR_RED}✗ $1${COLOR_NC}"
}

print_info() {
    echo -e "${COLOR_BLUE}ℹ $1${COLOR_NC}"
}

print_warning() {
    echo -e "${COLOR_YELLOW}⚠ $1${COLOR_NC}"
}

# --- Pre-flight Check ---
# Expands the tilde to the user's home directory
EVAL_COMPOSE_DIR=$(eval echo "$COMPOSE_DIR")

if [ ! -d "$EVAL_COMPOSE_DIR" ]; then
    print_error "OpenSILEX directory not found at $EVAL_COMPOSE_DIR"
    print_info "Please ensure the COMPOSE_DIR variable is set correctly in the script."
    exit 1
fi

cd "$EVAL_COMPOSE_DIR" || exit

# --- Core Functions ---

# Start the OpenSILEX service
start_service() {
    print_info "Starting OpenSILEX service..."
    if sudo docker compose --env-file "$ENV_FILE" ps | grep -q "running"; then
        print_warning "OpenSILEX is already running."
        sudo docker compose --env-file "$ENV_FILE" ps
        return
    fi
    if sudo docker compose --env-file "$ENV_FILE" up -d; then
        print_success "OpenSILEX service started successfully."
    else
        print_error "Failed to start OpenSILEX service."
        exit 1
    fi
}

# Stop the OpenSILEX service
stop_service() {
    print_info "Stopping OpenSILEX service..."
    if sudo docker compose --env-file "$ENV_FILE" down; then
        print_success "OpenSILEX service stopped successfully."
    else
        print_error "Failed to stop OpenSILEX service."
        exit 1
    fi
}

# Restart the OpenSILEX service
restart_service() {
    print_info "Restarting OpenSILEX service..."
    stop_service
    start_service
    print_success "OpenSILEX service restarted."
}

# Check the status of the OpenSILEX service
check_status() {
    print_info "Checking OpenSILEX service status..."
    sudo docker compose --env-file "$ENV_FILE" ps
}

# View the logs of the OpenSILEX service
view_logs() {
    print_info "Tailing logs for OpenSILEX service (Press Ctrl+C to exit)..."
    sudo docker compose --env-file "$ENV_FILE" logs --tail=100 -f
}

# Update the OpenSILEX installation
update_service() {
    print_info "Updating OpenSILEX..."
    
    print_info "Pulling latest changes from Git..."
    if git pull; then
        print_success "Git repository updated."
    else
        print_error "Failed to pull Git repository. Please check for local changes or connection issues."
        exit 1
    fi
    
    print_info "Building new container images..."
    if sudo docker compose --env-file "$ENV_FILE" build; then
        print_success "Containers built successfully."
    else
        print_error "Failed to build containers."
        exit 1
    fi
    
    print_info "Restarting service with updated images..."
    restart_service
    print_success "Update complete."
}

# Display help information
show_help() {
    echo "OpenSILEX Service Management Script"
    echo "---------------------------------"
    echo "Usage: $0 {start|stop|restart|status|logs|update}"
    echo
    echo "Commands:"
    echo "  start    - Start the OpenSILEX containers."
    echo "  stop     - Stop the OpenSILEX containers."
    echo "  restart  - Restart the OpenSILEX containers."
    echo "  status   - Show the status of the running containers."
    echo "  logs     - Tail the logs from the OpenSILEX containers."
    echo "  update   - Pull the latest version from Git, rebuild containers, and restart."
    echo
}

# --- Main Logic ---
case "$1" in
    start)
        start_service
        ;;
    stop)
        stop_service
        ;;
    restart)
        restart_service
        ;;
    status)
        check_status
        ;;
    logs)
        view_logs
        ;;
    update)
        update_service
        ;;
    *)
        show_help
        exit 1
        ;;
esac

exit 0
