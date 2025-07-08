# PHIS Installation Guide

Implementation of PHIS using OpenSILEX with complete Azure deployment and setup instructions.

## Table of Contents
- [Overview](#overview)
- [Script Descriptions](#script-descriptions)
- [Prerequisites](#prerequisites)
- [Step 1: Deploy Azure VM](#step-1-deploy-azure-vm)
- [Step 2: Connect to VM](#step-2-connect-to-vm)
- [Step 3: Install Dependencies](#step-3-install-dependencies)
- [Step 4: Install PHIS](#step-4-install-phis)
- [Step 5: Access PHIS](#step-5-access-phis)
- [Step 6: Create New User Accounts](#step-6-create-new-user-accounts)
- [Step 7: Service Management](#step-7-service-management)
- [VM Management](#vm-management)
- [Development Setup (Optional)](#development-setup-optional)
- [Troubleshooting](#troubleshooting)

## Overview

PHIS is implemented using OpenSILEX and deployed on Azure infrastructure. This guide walks you through:
1. Creating an Azure VM using ARM templates
2. Installing all required dependencies
3. Setting up OpenSILEX with PHIS theme configuration
4. Accessing the running application

## Script Descriptions

This installation process uses several automated scripts to simplify deployment:

### Deployment Scripts

#### `Deploy-AzurePHISVM.ps1` - Automated VM Deployment (PowerShell)
- **Purpose**: Automates the entire Azure VM deployment process with automatic SSH key detection
- **Key features**: 
  - Automatically finds and validates SSH keys on your system
  - Handles Azure login and subscription selection
  - Creates resource group if needed
  - Validates template before deployment
  - Saves connection information for future use
- **Usage**: `.\Deploy-AzurePHISVM.ps1` or with custom parameters
- **Platform**: Windows PowerShell or PowerShell 7+ on Linux/macOS

#### `template-vm.json` - Azure VM Template
- **Purpose**: Azure Resource Manager (ARM) template that creates the complete VM infrastructure
- **What it creates**: Virtual machine, network security group, virtual network, public IP, and network interface
- **Configuration**: Debian 12 VM with Standard_B2as_v2 size, SSH access, and ports 22, 80, 8080, and 28081 open
- **Security**: Uses SSH key authentication and trusted launch with secure boot enabled

#### `deploy-phis-vm.bat` - Windows Batch Launcher
- **Purpose**: Simple double-click deployment for Windows users
- **What it does**: Runs the PowerShell deployment script with proper execution policy
- **Usage**: Double-click the file in Windows Explorer

### VM Management Scripts

#### `Manage-AzurePHISVM.ps1` - VM Management Utilities
- **Purpose**: Provides easy VM management after deployment
- **Available actions**:
  - `Connect` - SSH to the VM
  - `Status` - Check VM status
  - `Start` - Start a stopped VM
  - `Stop` - Stop VM to save costs
  - `Restart` - Restart the VM
  - `GetIP` - Get the public IP address
  - `OpenPorts` - Show network security rules
  - `Delete` - Delete all resources
- **Usage**: `.\Manage-AzurePHISVM.ps1 -Action <ActionName>`

#### `Check-ExistingVM.ps1` - Check for Existing VM
- **Purpose**: Checks if a VM already exists and provides options
- **When to use**: If deployment fails due to existing resources
- **Options provided**: Use existing VM, delete and redeploy, or deploy with new name

### Utility Scripts

#### `New-SSHKey.ps1` - SSH Key Generator
- **Purpose**: Creates new SSH key pairs for Azure VM authentication
- **Key types supported**: ED25519 (recommended), RSA, ECDSA
- **Features**: Automatic clipboard copy, passphrase support
- **Usage**: `.\New-SSHKey.ps1` or `.\New-SSHKey.ps1 -KeyType rsa`

#### `Test-SSHKeys.ps1` - SSH Key Diagnostic Tool
- **Purpose**: Diagnoses SSH key issues and displays all keys found
- **What it shows**: SSH directories, public keys, private key status
- **Usage**: `.\Test-SSHKeys.ps1`

### Linux VM Scripts

#### `openSILEX-dependencies.sh` - System Dependencies Installer
- **Purpose**: Prepares the Debian system with all required software and configurations
- **Key installations**: Git, Docker, Docker Compose, and optionally VS Code
- **Configurations**: Adds user to docker group, fixes permissions, sets up development workspace
- **Safety features**: Includes error handling, privilege checks, and colored output for better user experience
- **Development support**: Configures VS Code Remote-SSH and Dev Containers for remote development

#### `openSILEX-installer.sh` - PHIS Application Installer  
- **Purpose**: Downloads, configures, and deploys OpenSILEX with PHIS theme customizations
- **Key actions**: Clones OpenSILEX repository (v1.4.7), configures PHIS theme settings, builds containers
- **PHIS customizations**: Sets application name, path prefix (/phis), and custom UI components
- **User management**: Creates default admin user account with credentials
- **Monitoring**: Waits up to 180 seconds for application startup and provides status feedback

#### `opensilex-manager.sh` - Service Management Tool
- **Purpose**: Provides easy management commands for OpenSILEX services after installation
- **Key features**: Start, stop, restart, status check, logs viewing, and troubleshooting
- **Commands available**: start, stop, restart, status, logs, info, shell, backup, clean
- **Safety features**: Confirmation prompts for destructive actions, colored output
- **Usage**: `./opensilex-manager.sh <command>` or interactive menu

#### `create-opensilex-user.sh` - User Creation Helper
- **Purpose**: Simplifies user creation with an easy-to-use command-line interface
- **Key features**: Parameter validation, automatic container checks, colored output
- **Parameters**: email, firstName, lastName, password, admin status, language
- **Usage**: `./create-opensilex-user.sh -e email -f firstName -l lastName -p password`
- **Benefits**: No need to remember long Docker commands, built-in help system

## Prerequisites

Before starting, ensure you have:
- Azure subscription with appropriate permissions
- **Windows:** PowerShell with Azure PowerShell module (Az) OR Azure CLI
- **Linux:** Azure CLI OR PowerShell 7+ with Azure PowerShell module (Az)
- SSH key pair for secure VM access (or use `New-SSHKey.ps1` to create one)
- Basic knowledge of Linux command line

### Azure Management Setup

#### Windows Users (Recommended: PowerShell)

```powershell
# Install Azure PowerShell module (run as Administrator)
Install-Module -Name Az -Repository PSGallery -Force -AllowClobber

# Or update if already installed
Update-Module -Name Az
```

#### Linux Users (Recommended: Azure CLI)

```bash
# Install Azure CLI (Ubuntu/Debian)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Or for other distributions, see: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
```

#### Alternative: PowerShell on Linux

```bash
# Install PowerShell 7+ on Linux (Ubuntu/Debian)
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

# Then install Azure module
pwsh -c "Install-Module -Name Az -Repository PSGallery -Force"
```

### Generate SSH Key (if needed)

#### Option 1: Use the SSH Key Generator Script

```powershell
# Generate new ED25519 key (recommended)
.\New-SSHKey.ps1

# Generate RSA key with custom name
.\New-SSHKey.ps1 -KeyType rsa -KeyName azure_vm_key
```

#### Option 2: Manual Generation

##### Windows Users
```powershell
# Generate new SSH key pair (Windows 10/11 with OpenSSH)
ssh-keygen -t ed25519 -a 100
# Display public key (copy this for the template)
Get-Content ~/.ssh/id_ed25519.pub
```

##### Linux Users
```bash
# Generate new SSH key pair
ssh-keygen -t ed25519 -a 100 

# Display public key (copy this for the template)
cat ~/.ssh/id_ed25519.pub
```

## Step 1: Deploy Azure VM

### Option 1: Automated Deployment (Recommended)

The easiest way to deploy is using the automated PowerShell script:

#### 1.1 Quick Start

```powershell
# Basic deployment with all defaults
.\Deploy-AzurePHISVM.ps1
```

The script will:
- Automatically find your SSH keys
- Let you select which key to use
- Handle Azure login
- Create the resource group
- Deploy the VM
- Save connection details

#### 1.2 Custom Deployment

```powershell
# Deploy with custom parameters
.\Deploy-AzurePHISVM.ps1 -VMName "phis-dev" -ResourceGroupName "RG-PHIS-DEV" -Location "eastus"

# Debug SSH key detection issues
.\Deploy-AzurePHISVM.ps1 -DebugSSHKeys
```

#### 1.3 Windows Double-Click Deployment

For Windows users who prefer not to use PowerShell directly:
1. Double-click `deploy-phis-vm.bat`
2. Follow the prompts

### Option 2: Manual Deployment

If you prefer manual deployment or need more control:

#### 2.1 Prepare the Template

1. Download or clone this repository to your local machine
2. Open `template-vm.json` in your preferred editor
3. Replace the SSH public key placeholder:
   ```json
   "sshPublicKey": {
     "type": "string",
     "defaultValue": "--- INCLUDE YOUR SSH PUBLIC KEY HERE ---"
   }
   ```
   With your actual SSH public key.

#### 2.2 Deploy Using PowerShell (Windows/Linux)

```powershell
# Install Azure PowerShell module if not already installed
Install-Module -Name Az -Repository PSGallery -Force

# Login to Azure
Connect-AzAccount

# Create resource group
New-AzResourceGroup -Name "RG-PHIS" -Location "West Europe"

# Deploy the template
New-AzResourceGroupDeployment `
  -ResourceGroupName "RG-PHIS" `
  -TemplateFile "template-vm.json" `
  -vmName "phis" `
  -adminUsername "azureuser" `
  -sshPublicKey "YOUR_SSH_PUBLIC_KEY"
```

#### 2.3 Deploy Using Azure CLI (Linux/Windows)

```bash
# Login to Azure
az login

# Create resource group
az group create --name RG-PHIS --location westeurope

# Deploy the template
az deployment group create \
  --resource-group RG-PHIS \
  --template-file template-vm.json \
  --parameters vmName=phis adminUsername=azureuser sshPublicKey="YOUR_SSH_PUBLIC_KEY"
```

#### 2.4 Deploy Using Azure Portal

1. Navigate to [Azure Portal](https://portal.azure.com)
2. Search for "Deploy a custom template"
3. Click "Build your own template in the editor"
4. Copy and paste the contents of `template-vm.json`
5. Update the SSH public key in the template
6. Click "Save" then "Review + create"
7. Fill in the parameters and deploy

### Post-Deployment

After successful deployment, the automated script will:
- Display the VM's public IP address
- Show the SSH connection command
- Save connection info to `phis-vm-connection-info.json`

To get VM information later:
```powershell
# Show all VM info
.\Manage-AzurePHISVM.ps1 -Action ShowInfo

# Get just the IP
.\Manage-AzurePHISVM.ps1 -Action GetIP
```

## Step 2: Connect to VM

### Option 1: Using the Management Script

```powershell
# Connect automatically with saved connection info
.\Manage-AzurePHISVM.ps1 -Action Connect
```

### Option 2: Manual Connection

#### From Windows
```powershell
# Connect via SSH from PowerShell (Windows 10/11 has built-in SSH)
ssh -i ~/.ssh/id_ed25519 azureuser@YOUR_VM_PUBLIC_IP
```

#### From Linux
```bash
# Connect via SSH
ssh -i ~/.ssh/id_ed25519 azureuser@YOUR_VM_PUBLIC_IP
```

If connection fails:
- Check VM status: `.\Manage-AzurePHISVM.ps1 -Action Status`
- Verify SSH key: `.\Test-SSHKeys.ps1`
- Check open ports: `.\Manage-AzurePHISVM.ps1 -Action OpenPorts`

## Step 3: Install Dependencies

Once connected to the VM, install all required dependencies:

### 3.1 Download the Dependencies Script

Once connected to the Linux VM:

```bash
# Download the dependencies installation script
wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-dependencies.sh

# Or copy from your local machine to the VM:
# From Windows PowerShell: scp openSILEX-dependencies.sh azureuser@YOUR_VM_IP:~/
# From Linux: scp openSILEX-dependencies.sh azureuser@YOUR_VM_IP:~/
```

### 3.2 Run Dependencies Installation

```bash
# Make script executable
chmod +x openSILEX-dependencies.sh

# Run the installation script
./openSILEX-dependencies.sh
```

This script will:
- Update system packages
- Install Git
- Install Docker and Docker Compose
- Configure Docker permissions
- Optionally install VS Code for development
- Set up development workspace

### 3.3 Apply Group Changes

**Important:** After the dependencies script completes, you must log out and back in to the Linux VM:

```bash
# Logout from the Linux VM
exit

# Reconnect from your local machine to apply Docker group changes
# Using the management script:
.\Manage-AzurePHISVM.ps1 -Action Connect

# Or manually:
ssh azureuser@YOUR_VM_PUBLIC_IP
```

### 3.4 Verify Docker Installation

```bash
# Test Docker installation
docker run --rm hello-world
```

## Step 4: Install PHIS

### 4.1 Download the PHIS Installer

Once connected to the Linux VM:

```bash
# Download the PHIS installation script
wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-installer.sh

# Or copy from your local machine to the VM:
# From Windows PowerShell: scp openSILEX-installer.sh azureuser@YOUR_VM_IP:~/
# From Linux: scp openSILEX-installer.sh azureuser@YOUR_VM_IP:~/
```

### 4.2 Run PHIS Installation

```bash
# Make script executable
chmod +x openSILEX-installer.sh

# Run the installation
./openSILEX-installer.sh
```

The installer will:
- Clone OpenSILEX Docker Compose repository (version 1.4.7)
- Configure environment variables for PHIS theme
- Set up proper permissions
- Build and start all containers
- Create admin user account
- Display access information

### 4.3 Monitor Installation Progress

The script will show progress and wait up to 180 seconds for OpenSILEX to start.

## Step 5: Access PHIS

After successful installation, you can access PHIS:

1. **Web Interface:** `http://YOUR_VM_PUBLIC_IP:28081/phis/app/`
2. **API Documentation:** `http://YOUR_VM_PUBLIC_IP:28081/phis/swagger-ui.html`
3. **API Endpoint:** `http://YOUR_VM_PUBLIC_IP:28081/phis/rest`

### Default Login Credentials

- **Username:** admin@opensilex.org
- **Password:** admin

**Important:** Change the default password immediately after first login!

## Step 6: Create New User Accounts

### Quick Method: Using Helper Script

Download and use the user creation helper script for the easiest experience:

```bash
# Download the helper script
wget https://raw.githubusercontent.com/lversen/PHIS/main/create-opensilex-user.sh
chmod +x create-opensilex-user.sh

# Create a regular user
./create-opensilex-user.sh \
  -e johndoe@example.com \
  -f John \
  -l Doe \
  -p password123

# Create an admin user
./create-opensilex-user.sh \
  -e admin@example.com \
  -f Jane \
  -l Admin \
  -p adminpass123 \
  -a true

# View help
./create-opensilex-user.sh --help
```

### Via Docker Command Line

You can also create users directly using Docker commands:

```bash
# Navigate to the OpenSILEX directory
cd ~/opensilex-docker-compose

# Create a new user
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user add \
  --email=newuser@example.com \
  --firstName=John \
  --lastName=Doe \
  --password=securePassword123 \
  --lang=en \
  --admin=false"

# Create an admin user
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user add \
  --email=admin2@example.com \
  --firstName=Jane \
  --lastName=Admin \
  --password=adminPassword123 \
  --lang=en \
  --admin=true"
```

### User Management Commands

```bash
# List all users
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user list"

# Update user password
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user update \
  --email=newuser@example.com \
  --password=newSecurePassword456"

# Delete a user
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user delete \
  --email=unwanteduser@example.com"

# Get help on user commands
sudo docker exec opensilex-docker-opensilexapp bash -c \
  "/home/opensilex/bin/opensilex.sh user --help"
```

### Batch User Creation

For multiple users, create a script:

```bash
# Create a file: create_users.sh
#!/bin/bash
cd ~/opensilex-docker-compose

# Array of users to create
users=(
  "researcher1@example.com:Alice:Smith:password123:false"
  "researcher2@example.com:Bob:Jones:password456:false"
  "labadmin@example.com:Carol:Davis:adminpass789:true"
)

for user in "${users[@]}"; do
  IFS=':' read -r email firstName lastName password admin <<< "$user"
  echo "Creating user: $email"
  sudo docker exec opensilex-docker-opensilexapp bash -c \
    "/home/opensilex/bin/opensilex.sh user add \
    --email=$email \
    --firstName=$firstName \
    --lastName=$lastName \
    --password=$password \
    --lang=en \
    --admin=$admin"
done
```

### Via Web Interface (Alternative)

1. Log in with admin credentials
2. Navigate to **Users** menu
3. Click **Add User**
4. Fill in user details and assign appropriate permissions

**Note:** The Docker method is preferred as it doesn't require authentication tokens and can be easily scripted for automation.

## Step 7: Service Management

### Using the OpenSILEX Manager Script (Recommended)

For easier service management, download and use the manager script:

```bash
# Download the manager script
wget https://raw.githubusercontent.com/lversen/PHIS/main/opensilex-manager.sh

# Or copy from your local machine to the VM:
# From Windows PowerShell: scp opensilex-manager.sh azureuser@YOUR_VM_IP:~/
# From Linux: scp opensilex-manager.sh azureuser@YOUR_VM_IP:~/

# Make it executable
chmod +x opensilex-manager.sh

# View available commands
./opensilex-manager.sh help

# Common commands:
./opensilex-manager.sh status    # Check service status
./opensilex-manager.sh restart   # Restart all services
./opensilex-manager.sh logs      # View logs
./opensilex-manager.sh stop      # Stop all services
./opensilex-manager.sh start     # Start all services
```

The manager script provides an interactive menu if run without arguments:
```bash
./opensilex-manager.sh
```

### Using Docker Compose Directly

You can also manage services directly with Docker Compose:

```bash
# Navigate to the installation directory
cd ~/opensilex-docker-compose

# Stop all services
sudo docker compose --env-file opensilex.env down

# Start all services
sudo docker compose --env-file opensilex.env up -d

# Restart specific service
sudo docker compose --env-file opensilex.env restart opensilexapp

# View logs
sudo docker compose --env-file opensilex.env logs -f opensilexapp
```

### Service Status

```bash
# Quick status check with manager script
./opensilex-manager.sh status

# Or check manually:
# Check all running containers
sudo docker ps

# Check container health
sudo docker inspect opensilex-docker-opensilexapp | grep -A 5 Health
```

## VM Management

### Using the Management Script

The `Manage-AzurePHISVM.ps1` script provides easy VM management:

```powershell
# Check VM status
.\Manage-AzurePHISVM.ps1 -Action Status

# Stop VM to save costs
.\Manage-AzurePHISVM.ps1 -Action Stop

# Start VM when needed
.\Manage-AzurePHISVM.ps1 -Action Start

# Restart VM
.\Manage-AzurePHISVM.ps1 -Action Restart

# Get public IP
.\Manage-AzurePHISVM.ps1 -Action GetIP

# Check open ports
.\Manage-AzurePHISVM.ps1 -Action OpenPorts

# Delete all resources (careful!)
.\Manage-AzurePHISVM.ps1 -Action Delete
```

### Cost Management Tips

- **Stop VM when not in use**: Saves significant costs
- **Use auto-shutdown**: Configure in Azure Portal
- **Monitor usage**: Check Azure Cost Management
- **Consider smaller VM size**: For testing/development

### Handling Existing VMs

If you encounter deployment errors due to existing resources:

```powershell
# Check existing VM
.\Check-ExistingVM.ps1

# This will show you options to:
# - Use the existing VM
# - Delete and redeploy
# - Deploy with a different name
```

## Development Setup (Optional)

### VS Code Remote Development

If you installed VS Code during the dependencies setup:

1. **Install Remote-SSH Extension** on your local VS Code
2. **Connect to VM:**
   - Press `F1` → "Remote-SSH: Connect to Host"
   - Enter: `azureuser@YOUR_VM_PUBLIC_IP`
3. **Open workspace:** `/home/azureuser/development`

### Development Workflow

```bash
# Clone your fork
cd ~/development
git clone https://github.com/YOUR_USERNAME/opensilex.git

# Make changes and test
cd opensilex
# ... make your changes ...

# Rebuild containers
cd ~/opensilex-docker-compose
sudo docker compose --env-file opensilex.env build opensilexapp
sudo docker compose --env-file opensilex.env up -d
```

## Troubleshooting

### Deployment Issues

#### SSH Key Not Found
```powershell
# Check your SSH keys
.\Test-SSHKeys.ps1

# Generate new key if needed
.\New-SSHKey.ps1
```

#### VM Already Exists
```powershell
# Check existing VM and get options
.\Check-ExistingVM.ps1
```

#### Azure Login Issues
```powershell
# Clear Azure context and re-login
Clear-AzContext -Force
Connect-AzAccount
```

### Connection Issues

#### SSH Connection Refused
```bash
# Check if VM is running
.\Manage-AzurePHISVM.ps1 -Action Status

# Check security rules
.\Manage-AzurePHISVM.ps1 -Action OpenPorts

# Verify SSH service on VM (if you can access via Azure Portal)
sudo systemctl status ssh
```

#### Firewall Blocking Access
- Verify Network Security Group rules in Azure Portal
- Check your local firewall settings
- Try connecting from a different network

### Installation Issues

#### Docker Permission Denied
```bash
# Ensure user is in docker group
groups

# If not, add and re-login
sudo usermod -aG docker $USER
exit
# Then reconnect
```

#### Port Already in Use
```bash
# Check what's using the port
sudo lsof -i :28081

# Stop conflicting service or change PHIS port in opensilex.env
```

#### Container Won't Start
```bash
# Check logs
sudo docker logs opensilex-docker-opensilexapp

# Clean and rebuild using manager script
./opensilex-manager.sh clean
./opensilex-manager.sh start

# Or manually remove and rebuild
cd ~/opensilex-docker-compose
sudo docker compose --env-file opensilex.env down
sudo docker system prune -f
./openSILEX-installer.sh
```

### Log Locations

- **View logs with manager script:** `./opensilex-manager.sh logs`
- **OpenSILEX Logs:** `sudo docker logs opensilex-docker-opensilexapp`
- **MongoDB Logs:** `sudo docker logs opensilex-docker-mongodb`
- **Container Status:** `sudo docker ps -a`

### Getting Help

If you encounter issues:

1. Check the troubleshooting section above
2. Review container logs for error messages
3. Verify all prerequisites are met
4. Ensure Azure resources are properly configured

### Useful Commands

```bash
# View all containers
sudo docker ps -a

# Restart PHIS (using manager script)
./opensilex-manager.sh restart

# Or manually with docker compose
cd ~/opensilex-docker-compose
sudo docker compose --env-file opensilex.env restart

# View configuration
cat ~/opensilex-docker-compose/opensilex.env

# Check disk space
df -h

# Check memory usage
free -h

# Quick service status
./opensilex-manager.sh status
```

## Configuration Details

The PHIS installation includes these customizations:

- **Application Name:** Phis
- **Theme:** opensilex-phis#phis
- **Path Prefix:** /phis
- **Custom Components:**
  - Login: opensilex-phis-PhisLoginComponent
  - Header: opensilex-phis-PhisHeaderComponent
  - Footer: opensilex-DefaultFooterComponent
  - Menu: opensilex-DefaultMenuComponent

These settings are automatically configured by the installation script in the `opensilex.env` file.

---

**Note:** This installation creates a development/testing environment. For production deployments, additional security hardening, backup strategies, and monitoring should be implemented.