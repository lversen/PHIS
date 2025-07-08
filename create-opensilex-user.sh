#!/bin/bash
# OpenSILEX User Creation Helper Script
# Makes it easier to create users without typing long Docker commands

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
LANG="en"
ADMIN="false"

# Function to print colored output
print_color() {
    printf "${2}${1}${NC}\n"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -e, --email       Email address (required)"
    echo "  -f, --firstName   First name (required)"
    echo "  -l, --lastName    Last name (required)"
    echo "  -p, --password    Password (required)"
    echo "  -a, --admin       Make user admin (true/false, default: false)"
    echo "  --lang            Language (default: en)"
    echo "  -h, --help        Show this help message"
    echo ""
    echo "Example:"
    echo "  $0 -e john@example.com -f John -l Doe -p password123"
    echo "  $0 -e admin@example.com -f Jane -l Admin -p adminpass -a true"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -e|--email)
            EMAIL="$2"
            shift 2
            ;;
        -f|--firstName)
            FIRST_NAME="$2"
            shift 2
            ;;
        -l|--lastName)
            LAST_NAME="$2"
            shift 2
            ;;
        -p|--password)
            PASSWORD="$2"
            shift 2
            ;;
        -a|--admin)
            ADMIN="$2"
            shift 2
            ;;
        --lang)
            LANG="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            print_color "Unknown option: $1" "$RED"
            show_usage
            exit 1
            ;;
    esac
done

# Validate required parameters
if [ -z "$EMAIL" ]; then
    print_color "Error: Email is required" "$RED"
    show_usage
    exit 1
fi

if [ -z "$FIRST_NAME" ]; then
    print_color "Error: First name is required" "$RED"
    show_usage
    exit 1
fi

if [ -z "$LAST_NAME" ]; then
    print_color "Error: Last name is required" "$RED"
    show_usage
    exit 1
fi

if [ -z "$PASSWORD" ]; then
    print_color "Error: Password is required" "$RED"
    show_usage
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "opensilex.env" ]; then
    if [ -f "$HOME/opensilex-docker-compose/opensilex.env" ]; then
        cd "$HOME/opensilex-docker-compose"
    else
        print_color "Error: opensilex.env not found. Please run from opensilex-docker-compose directory" "$RED"
        exit 1
    fi
fi

# Check if container is running
if ! sudo docker ps | grep -q opensilex-docker-opensilexapp; then
    print_color "Error: OpenSILEX container is not running" "$RED"
    print_color "Start it with: sudo docker compose --env-file opensilex.env up -d" "$YELLOW"
    exit 1
fi

# Create the user
print_color "Creating user: $EMAIL" "$BLUE"
print_color "First Name: $FIRST_NAME" "$BLUE"
print_color "Last Name: $LAST_NAME" "$BLUE"
print_color "Admin: $ADMIN" "$BLUE"
print_color "Language: $LANG" "$BLUE"

if sudo docker exec opensilex-docker-opensilexapp bash -c \
    "/home/opensilex/bin/opensilex.sh user add \
    --email=$EMAIL \
    --firstName=$FIRST_NAME \
    --lastName=$LAST_NAME \
    --password=$PASSWORD \
    --lang=$LANG \
    --admin=$ADMIN"; then
    
    print_color "\n✓ User created successfully!" "$GREEN"
    
    if [ "$ADMIN" = "true" ]; then
        print_color "  This user has admin privileges" "$YELLOW"
    fi
    
    print_color "\nThe user can now log in at:" "$GREEN"
    # Get the VM's public IP if available
    if command -v az &> /dev/null; then
        PUBLIC_IP=$(az vm show -d -g RG-PHIS -n phis --query publicIps -o tsv 2>/dev/null || echo "YOUR_VM_IP")
    else
        PUBLIC_IP="YOUR_VM_IP"
    fi
    print_color "  http://$PUBLIC_IP:28081/phis/app/" "$GREEN"
else
    print_color "\n✗ Failed to create user" "$RED"
    exit 1
fi

# List all users
echo ""
read -p "Would you like to see all users? (y/N) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_color "\nListing all users:" "$BLUE"
    sudo docker exec opensilex-docker-opensilexapp bash -c \
        "/home/opensilex/bin/opensilex.sh user list"
fi