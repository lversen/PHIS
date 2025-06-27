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
- **Windows:** PowerShell with Azure PowerShell module (Az) OR Azure CLI
- **Linux:** Azure CLI OR PowerShell 7+ with Azure PowerShell module (Az)
- SSH key pair for secure VM access
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

If you don't have an SSH key pair:

#### Windows Users

```powershell
# Generate new SSH key pair (Windows 10/11 with OpenSSH)
ssh-keygen -t ed25519 -a 100
# Display public key (copy this for the template)
Get-Content ~/.ssh/id_ed25519.pub
```

#### Linux Users

```bash
# Generate new SSH key pair
ssh-keygen -t ed25519 -a 100 

# Display public key (copy this for the template)
cat ~/.ssh/id_ed25519.pub
```

## Step 1: Deploy Azure VM

### 1.1 Prepare the Template

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

### 1.2 Deploy Using PowerShell (Windows/Linux)

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

### 1.3 Deploy Using Azure CLI (Linux/Windows)

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

### 1.4 Deploy Using Azure Portal (Alternative)

1. Navigate to [Azure Portal](https://portal.azure.com)
2. Search for "Deploy a custom template"
3. Click "Build your own template in the editor"
4. Copy and paste the contents of `template-vm.json`
5. Update the SSH public key in the template
6. Click "Save" then "Review + create"
7. Fill in the parameters and deploy

### 1.5 Get VM Public IP

After deployment completes:

**Using PowerShell:**
```powershell
# Get the public IP address
(Get-AzPublicIpAddress -ResourceGroupName "RG-PHIS" -Name "phis-ip").IpAddress
```

**Using Azure CLI:**
```bash
# Get the public IP address
az vm show -d -g RG-PHIS -n phis --query publicIps -o tsv
```

Or check in the Azure Portal under the VM's overview page.

## Step 2: Connect to VM

Connect to your newly created Linux VM:

#### From Windows

```powershell
# Connect via SSH from PowerShell (Windows 10/11 has built-in SSH)
ssh azureuser@YOUR_VM_PUBLIC_IP
```

#### From Linux

```bash
# Connect via SSH
ssh azureuser@YOUR_VM_PUBLIC_IP
```

If connection fails, verify:
- VM is running
- Network Security Group allows SSH (port 22)  
- SSH key is correct

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

#### Setup for Windows/Linux

1. Install VS Code on your local machine with extensions:
   - Remote - SSH
   - Dev Containers

2. Connect to Linux VM via Remote-SSH:
   - Open VS Code on your local machine
   - Press `Ctrl+Shift+P`
   - Type "Remote-SSH: Connect to Host"
   - Enter `azureuser@YOUR_VM_IP`

3. Open project folder on the Linux VM:
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

**Check VM status with PowerShell:**
```powershell
# Check VM status
Get-AzVM -ResourceGroupName "RG-PHIS" -Name "phis" -Status

# Start VM if stopped
Start-AzVM -ResourceGroupName "RG-PHIS" -Name "phis"
```

**Check VM status with Azure CLI:**
```bash
# Check VM status
az vm get-instance-view --resource-group RG-PHIS --name phis --query instanceView.statuses

# Start VM if stopped
az vm start --resource-group RG-PHIS --name phis
```

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
```

**Verify Azure NSG allows port 28081 with PowerShell:**
```powershell
# Check Network Security Group rules
Get-AzNetworkSecurityGroup -ResourceGroupName "RG-PHIS" -Name "phis-nsg" | Get-AzNetworkSecurityRuleConfig
```

**Verify Azure NSG with Azure CLI:**
```bash
# Check NSG rules
az network nsg rule list --resource-group RG-PHIS --nsg-name phis-nsg --output table
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