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

### `template-vm.json` - Azure VM Template
- **Purpose**: Azure Resource Manager (ARM) template that creates the complete VM infrastructure
- **What it creates**: Virtual machine, network security group, virtual network, public IP, and network interface
- **Configuration**: Debian 12 VM with Standard_B2as_v2 size, SSH access, and ports 22, 80, and 28081 open
- **Security**: Uses SSH key authentication and trusted launch with secure boot enabled

### `openSILEX-dependencies.sh` - System Dependencies Installer
- **Purpose**: Prepares the Debian system with all required software and configurations
- **Key installations**: Git, Docker, Docker Compose, and optionally VS Code
- **Configurations**: Adds user to docker group, fixes permissions, sets up development workspace
- **Safety features**: Includes error handling, privilege checks, and colored output for better user experience
- **Development support**: Configures VS Code Remote-SSH and Dev Containers for remote development

### `openSILEX-installer.sh` - PHIS Application Installer  
- **Purpose**: Downloads, configures, and deploys OpenSILEX with PHIS theme customizations
- **Key actions**: Clones OpenSILEX repository (v1.4.7), configures PHIS theme settings, builds containers
- **PHIS customizations**: Sets application name, path prefix (/phis), and custom UI components
- **User management**: Creates default admin user account with credentials
- **Monitoring**: Waits up to 180 seconds for application startup and provides status feedback

## Prerequisites

Before starting, ensure you have:
- Azure subscription with appropriate permissions
- Azure CLI installed locally, or access to Azure Cloud Shell
- SSH key pair for secure VM access
- Basic knowledge of Linux command line

### Generate SSH Key (if needed)

If you don't have an SSH key pair:

```bash
# Generate new SSH key pair
ssh-keygen -t ed25519 -a 100 

# Display public key (copy this for the template)
cat ~/.ssh/id_ed25519.pub
```

## Step 1: Deploy Azure VM

### 1.1 Prepare the Template

1. Download or clone this repository
2. Open `template-vm.json` 
3. Replace the SSH public key placeholder:
   ```json
   "sshPublicKey": {
     "type": "string",
     "defaultValue": "--- INCLUDE YOUR SSH PUBLIC KEY HERE ---"
   }
   ```
   With your actual SSH public key.

### 1.2 Deploy Using Azure CLI

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

### 1.3 Deploy Using Azure Portal

1. Navigate to [Azure Portal](https://portal.azure.com)
2. Search for "Deploy a custom template"
3. Click "Build your own template in the editor"
4. Copy and paste the contents of `template-vm.json`
5. Update the SSH public key in the template
6. Click "Save" then "Review + create"
7. Fill in the parameters and deploy

### 1.4 Get VM Public IP

After deployment completes:

```bash
# Get the public IP address
az vm show -d -g RG-PHIS -n phis --query publicIps -o tsv
```

Or check in the Azure Portal under the VM's overview page.

## Step 2: Connect to VM

Connect to your newly created VM:

```bash
# Replace with your VM's public IP
ssh azureuser@YOUR_VM_PUBLIC_IP
```

If connection fails, verify:
- VM is running
- Network Security Group allows SSH (port 22)
- SSH key is correct

## Step 3: Install Dependencies

Once connected to the VM, install all required dependencies:

### 3.1 Download the Dependencies Script

```bash
# Download the dependencies installation script
wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-dependencies.sh

# Or if you have the file locally, copy it to the VM:
# scp openSILEX-dependencies.sh azureuser@YOUR_VM_IP:~/
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

**Important:** After the dependencies script completes, you must log out and back in:

```bash
# Logout
exit

# Reconnect to apply Docker group changes
ssh azureuser@YOUR_VM_PUBLIC_IP
```

### 3.4 Verify Docker Installation

```bash
# Test Docker installation
docker run --rm hello-world
```

## Step 4: Install PHIS

### 4.1 Download the PHIS Installer

```bash
# Download the PHIS installation script
wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-installer.sh

# Or copy from local machine:
# scp openSILEX-installer.sh azureuser@YOUR_VM_IP:~/
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

The script will show progress and wait up to 180 seconds for OpenSILEX to start. You'll see output like:

```
Waiting for OpenSilex to start (up to 180s)...
✅ OpenSilex with Phis theme is running at http://YOUR_VM_IP:28081/phis/app
Default login: admin@opensilex.org / admin
🎨 Theme: Phis (configured with custom components)
✅ Admin user 'admin@opensilex.org' created successfully.
```

## Step 5: Access PHIS

### 5.1 Application URLs

Once installation completes, access PHIS at:

- **Main Application:** `http://YOUR_VM_IP:28081/phis/app`
- **API Documentation:** `http://YOUR_VM_IP:28081/phis/api-docs`

### 5.2 Default Credentials

- **Username:** `admin@opensilex.org`
- **Password:** `admin`

**Security Note:** Change the default password immediately after first login.

### 5.3 Verify Installation

1. Open your web browser
2. Navigate to `http://YOUR_VM_IP:28081/phis/app`
3. Log in with default credentials
4. Verify PHIS theme is applied correctly

## Development Setup (Optional)

For development work with VS Code:

### 5.1 VS Code Remote Development

1. Install VS Code locally with extensions:
   - Remote - SSH
   - Dev Containers

2. Connect to VM via Remote-SSH:
   - Open VS Code
   - Press `Ctrl+Shift+P`
   - Type "Remote-SSH: Connect to Host"
   - Enter `azureuser@YOUR_VM_IP`

3. Open project folder:
   - Navigate to `/home/azureuser/opensilex-docker-compose`

4. Use Dev Containers:
   - Press `Ctrl+Shift+P`
   - Type "Dev Containers: Reopen in Container"

### 5.2 Manual Development Setup

```bash
# Navigate to project directory
cd ~/opensilex-docker-compose

# View logs
sudo docker logs opensilex-docker-opensilexapp --tail=50

# Restart containers if needed
sudo docker compose --env-file opensilex.env down
sudo docker compose --env-file opensilex.env up -d
```

## Troubleshooting

### Common Issues

#### 1. Cannot Connect to VM
- Check VM is running in Azure Portal
- Verify Network Security Group rules allow SSH (port 22)
- Confirm SSH key is correct

#### 2. Docker Permission Denied
```bash
# Fix Docker socket permissions
sudo chmod 666 /var/run/docker.sock

# Verify user is in docker group
groups | grep docker

# If not in group, add user and restart session
sudo usermod -aG docker $(whoami)
exit
# Reconnect via SSH
```

#### 3. PHIS Not Accessible
```bash
# Check container status
sudo docker ps

# View OpenSILEX logs
sudo docker logs opensilex-docker-opensilexapp --tail=100

# Check port 28081 is open
sudo netstat -tlnp | grep 28081

# Verify Azure NSG allows port 28081
```

#### 4. Installation Fails
```bash
# Clean up and retry
cd ~/opensilex-docker-compose
sudo docker compose --env-file opensilex.env down
sudo docker system prune -f
./openSILEX-installer.sh
```

### Log Locations

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

# Restart PHIS
cd ~/opensilex-docker-compose
sudo docker compose --env-file opensilex.env restart

# View configuration
cat ~/opensilex-docker-compose/opensilex.env

# Check disk space
df -h

# Check memory usage
free -h
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