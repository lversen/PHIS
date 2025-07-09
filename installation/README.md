# PHIS Automated Installation Orchestrator

This orchestration system automates the entire PHIS installation process, from Azure VM creation to running service deployment.

## 🚀 Quick Start

### Windows Users - Easiest Method
1. **Double-click** `install-phis.bat`
2. **Choose option 1** for full installation
3. **Follow the prompts** - the script handles everything automatically

### PowerShell Users
```powershell
# Full automated installation
.\Install-PHIS.ps1

# Install on existing VM
.\Install-PHIS.ps1 -UseExistingVM -VMIPAddress "YOUR_VM_IP"

# Check status
.\Install-PHIS.ps1 -Action Status
```

## 📋 Prerequisites

Before running the orchestrator, ensure you have:

1. **Azure PowerShell Module**
   ```powershell
   # Check if installed
   Get-Module -ListAvailable -Name Az
   
   # Install if missing (run as Administrator)
   Install-Module -Name Az -Repository PSGallery -Force
   ```

2. **SSH Key** (the script will auto-detect existing keys)
   ```powershell
   # Generate if you don't have one
   ssh-keygen -t ed25519 -a 100
   ```

3. **Azure Subscription** with permissions to create resources

## 📁 Required Files

Ensure these files are in the same directory:

### For Full Installation (VM + PHIS)
- `Install-PHIS.ps1` - Main orchestrator script
- `Deploy-AzurePHISVM.ps1` - VM deployment script
- `template-vm.json` - Azure VM template
- `install-phis.bat` - Windows batch launcher (optional)

### For Installation on Existing VM Only
- `Install-PHIS.ps1` - Main orchestrator script

## 🔧 Installation Options

### Option 1: Full Installation (Recommended)
Creates a new Azure VM and installs PHIS automatically.

```powershell
.\Install-PHIS.ps1
```

**What happens:**
1. ✅ Checks prerequisites
2. ✅ Auto-detects SSH keys
3. ✅ Creates Azure VM in West Europe
4. ✅ Installs all dependencies (Docker, Git, etc.)
5. ✅ Deploys PHIS with custom configuration
6. ✅ Starts all services
7. ✅ Displays access URLs and credentials

### Option 2: Install on Existing VM
Use this if you already have a Debian 12 VM.

```powershell
.\Install-PHIS.ps1 -UseExistingVM -VMIPAddress "20.50.100.200"
```

**Requirements for existing VM:**
- Debian 12 operating system
- SSH access with key authentication
- Ports 22, 80, 8080, and 28081 open
- Sudo privileges for the user

### Option 3: VM Creation Only
Creates the VM without installing PHIS.

```powershell
.\Install-PHIS.ps1 -Action VMOnly
```

### Option 4: Check Status
Verifies the installation status of an existing deployment.

```powershell
# Using saved connection info
.\Install-PHIS.ps1 -Action Status

# Specifying VM IP
.\Install-PHIS.ps1 -Action Status -VMIPAddress "20.50.100.200"
```

## 🎯 Advanced Usage

### Custom Parameters

```powershell
# Custom VM name and resource group
.\Install-PHIS.ps1 -VMName "phis-dev" -ResourceGroupName "RG-PHIS-DEV"

# Different Azure region
.\Install-PHIS.ps1 -Location "eastus"

# Specify SSH key explicitly
.\Install-PHIS.ps1 -SSHKeyPath "C:\Users\me\.ssh\my_key"

# Skip dependencies (if already installed)
.\Install-PHIS.ps1 -UseExistingVM -VMIPAddress "20.50.100.200" -SkipDependencies
```

### Troubleshooting Options

```powershell
# Debug SSH key detection
.\Deploy-AzurePHISVM.ps1 -DebugSSHKeys

# Test SSH connectivity
.\Install-PHIS.ps1 -Action Status -VMIPAddress "YOUR_IP"
```

## 📊 What Gets Installed

### Infrastructure (Azure)
- **VM**: Standard_B2as_v2 (2 vCPUs, 8 GB RAM)
- **OS**: Debian 12
- **Storage**: 30 GB Premium SSD
- **Network**: Public IP with required ports open

### Software Stack
- Docker and Docker Compose
- Git
- OpenSILEX v1.4.7
- PHIS theme and configuration
- MongoDB (containerized)
- All required dependencies

### Configuration
- **Application Name**: Phis
- **Path Prefix**: /phis
- **Theme**: opensilex-phis#phis
- **Default Admin**: admin@opensilex.org

## 🌐 Accessing PHIS

After successful installation:

1. **Web Interface**: `http://YOUR_VM_IP:28081/phis/app/`
2. **API Documentation**: `http://YOUR_VM_IP:28081/phis/swagger-ui.html`
3. **API Endpoint**: `http://YOUR_VM_IP:28081/phis/rest`

**Default Credentials:**
- Username: `admin@opensilex.org`
- Password: `admin`

⚠️ **Important**: Change the default password immediately after first login!

## 🛠️ Post-Installation Management

### SSH to Your VM
```bash
ssh -i ~/.ssh/id_ed25519 azureuser@YOUR_VM_IP
```

### Service Management
Once connected to the VM:
```bash
# Check status
./opensilex-manager.sh status

# Restart service
./opensilex-manager.sh restart

# View logs
./opensilex-manager.sh logs

# Stop service
./opensilex-manager.sh stop
```

### VM Management
From your local machine:
```powershell
# Stop VM (save costs)
.\Manage-AzurePHISVM.ps1 -Action Stop

# Start VM
.\Manage-AzurePHISVM.ps1 -Action Start

# Get VM info
.\Manage-AzurePHISVM.ps1 -Action ShowInfo
```

## 🔍 Troubleshooting

### Installation Fails

1. **Check Prerequisites**
   ```powershell
   # Verify Azure module
   Get-Module -ListAvailable -Name Az
   
   # Check SSH keys
   .\Test-SSHKeys.ps1
   ```

2. **Connection Issues**
   - Verify VM is running: `.\Manage-AzurePHISVM.ps1 -Action Status`
   - Check firewall rules allow your IP
   - Ensure SSH key permissions are correct

3. **Service Not Starting**
   - SSH to VM and check logs: `sudo docker logs opensilex-docker-opensilexapp`
   - Verify Docker is running: `sudo systemctl status docker`
   - Check disk space: `df -h`

### Common Issues

**"Cannot find SSH key"**
- Generate a new key: `ssh-keygen -t ed25519 -a 100`
- Or specify path: `-SSHKeyPath "path/to/key"`

**"VM already exists"**
- Use existing: `-UseExistingVM -VMIPAddress "IP"`
- Or delete and recreate: `.\Manage-AzurePHISVM.ps1 -Action Delete`

**"Docker permission denied"**
- The script handles this automatically
- If persists, logout and login to VM again

**"Port 28081 not accessible"**
- Check VM network security group in Azure Portal
- Verify service is running: SSH and run `./opensilex-manager.sh status`

## 📝 Logs and Debugging

### View Installation Logs
```powershell
# Check saved connection info
Get-Content .\phis-vm-connection-info.json

# View orchestrator output
.\Install-PHIS.ps1 -Verbose
```

### On the VM
```bash
# Docker containers status
sudo docker ps -a

# OpenSILEX logs
sudo docker logs opensilex-docker-opensilexapp --tail 100

# System logs
journalctl -u docker -n 50
```

## 🔐 Security Notes

1. **SSH Keys**: Keep your private keys secure
2. **Firewall**: Consider restricting SSH access to your IP
3. **Passwords**: Change all default passwords immediately
4. **Updates**: Regularly update the system and containers

## 💡 Tips

1. **Save Money**: Stop the VM when not in use
   ```powershell
   .\Manage-AzurePHISVM.ps1 -Action Stop
   ```

2. **Backup**: Create VM snapshots before major changes

3. **Development**: Use VS Code Remote-SSH for development
   - Install Remote-SSH extension
   - Connect to `azureuser@YOUR_VM_IP`

4. **Monitoring**: Set up Azure alerts for VM health

## 📞 Support

If you encounter issues:

1. Check the troubleshooting section above
2. Review logs on both local machine and VM
3. Ensure all prerequisites are met
4. Verify network connectivity

## 🎉 Success Checklist

After installation, verify:

- [ ] Can access web interface at http://YOUR_VM_IP:28081/phis/app/
- [ ] Can login with default credentials
- [ ] Changed default password
- [ ] All Docker containers are running
- [ ] API documentation is accessible
- [ ] Can SSH to VM for management

---

**Note**: This orchestrator creates a development/testing environment. For production deployments, additional security hardening, backup strategies, and monitoring should be implemented.