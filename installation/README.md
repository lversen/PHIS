# PHIS Unified Installation System

This unified installation system replaces all previous scripts with a single, comprehensive solution for deploying and managing PHIS on Azure.

## 🚀 Quick Start

### Windows Users - Easiest Method
1. **Double-click** `PHIS.bat`
2. **Select from the menu** - everything is automated!

### PowerShell Direct Commands
```powershell
# Interactive menu (recommended for first-time users)
.\PHIS-Master.ps1

# Complete installation (VM + PHIS)
.\PHIS-Master.ps1 -Command FullInstall

# Install on existing VM
.\PHIS-Master.ps1 -Command Install -VMIPAddress "20.50.100.200"

# Check status
.\PHIS-Master.ps1 -Command Status
```

## 📋 Prerequisites

1. **Azure PowerShell Module**
   ```powershell
   # Check if installed
   Get-Module -ListAvailable -Name Az
   
   # Install if missing (run as Administrator)
   Install-Module -Name Az -Repository PSGallery -Force
   
   # Or install for current user only
   Install-Module -Name Az -Scope CurrentUser
   ```

2. **SSH Key** (auto-generated if needed)
   ```powershell
   # Generate SSH key through the script
   .\PHIS-Master.ps1 -Command GenerateSSHKey
   
   # Or manually
   ssh-keygen -t ed25519 -a 100
   ```

3. **Azure Subscription** with appropriate permissions

4. **Required Files** (for VM deployment)
   - `PHIS-Master.ps1` - The master script
   - `template-vm.json` - Azure VM template
   - `PHIS.bat` - Windows launcher (optional)

## 🎯 Available Commands

### Installation Commands
| Command | Description | Example |
|---------|-------------|---------|
| `FullInstall` | Deploy VM + Install PHIS | `.\PHIS-Master.ps1 -Command FullInstall` |
| `Deploy` | Create Azure VM only | `.\PHIS-Master.ps1 -Command Deploy` |
| `Install` | Install PHIS on existing VM | `.\PHIS-Master.ps1 -Command Install -VMIPAddress "IP"` |

### Management Commands
| Command | Description | Example |
|---------|-------------|---------|
| `Status` | Check installation status | `.\PHIS-Master.ps1 -Command Status` |
| `Connect` | SSH to VM | `.\PHIS-Master.ps1 -Command Connect` |
| `Start` | Start stopped VM | `.\PHIS-Master.ps1 -Command Start` |
| `Stop` | Stop VM (save costs) | `.\PHIS-Master.ps1 -Command Stop` |
| `Restart` | Restart VM | `.\PHIS-Master.ps1 -Command Restart` |
| `Delete` | Delete all resources | `.\PHIS-Master.ps1 -Command Delete` |
| `Logs` | View service logs | `.\PHIS-Master.ps1 -Command Logs` |

### Utility Commands
| Command | Description | Example |
|---------|-------------|---------|
| `Diagnose` | Run diagnostics | `.\PHIS-Master.ps1 -Command Diagnose` |
| `GenerateSSHKey` | Create new SSH key | `.\PHIS-Master.ps1 -Command GenerateSSHKey` |
| `TestSSHKeys` | Check SSH key configuration | `.\PHIS-Master.ps1 -Command TestSSHKeys` |
| `ShowInfo` | Display VM information | `.\PHIS-Master.ps1 -Command ShowInfo` |
| `GetIP` | Get VM public IP | `.\PHIS-Master.ps1 -Command GetIP` |
| `OpenPorts` | Show network security rules | `.\PHIS-Master.ps1 -Command OpenPorts` |
| `Menu` | Interactive menu (default) | `.\PHIS-Master.ps1` |

## 🔧 Common Parameters

```powershell
# Custom VM name and resource group
.\PHIS-Master.ps1 -Command FullInstall -VMName "phis-dev" -ResourceGroupName "RG-PHIS-DEV"

# Different Azure region
.\PHIS-Master.ps1 -Command Deploy -Location "eastus"

# Custom SSH username
.\PHIS-Master.ps1 -Command Install -AdminUsername "myuser" -VMIPAddress "20.50.100.200"

# Specify SSH key path
.\PHIS-Master.ps1 -Command Connect -SSHKeyPath "C:\keys\my_key"

# Skip dependency installation (if already installed)
.\PHIS-Master.ps1 -Command Install -VMIPAddress "IP" -SkipDependencies
```

## 📊 What Gets Installed

### Infrastructure (Azure)
- **VM**: Standard_B2as_v2 (2 vCPUs, 8 GB RAM)
- **OS**: Debian 12
- **Storage**: 30 GB Premium SSD
- **Network**: Public IP with required ports (22, 80, 8080, 28081)

### Software Stack
- Docker and Docker Compose
- Git
- OpenSILEX v1.4.7
- PHIS theme and configuration
- MongoDB (containerized)
- All required dependencies

## 🌐 Accessing PHIS

After successful installation:

1. **Web Interface**: `http://YOUR_VM_IP:28081/phis/app/`
2. **API Documentation**: `http://YOUR_VM_IP:28081/phis/swagger-ui.html`
3. **API Endpoint**: `http://YOUR_VM_IP:28081/phis/rest`

**Default Credentials:**
- Username: `admin@opensilex.org`
- Password: `admin`

⚠️ **Important**: Change the default password immediately after first login!

## 💡 Usage Examples

### Example 1: Complete New Installation
```powershell
# Run this for a complete automated installation
.\PHIS-Master.ps1 -Command FullInstall
```

### Example 2: Install on Existing Debian 12 VM
```powershell
# If you already have a VM
.\PHIS-Master.ps1 -Command Install -VMIPAddress "20.50.100.200"
```

### Example 3: Daily Management
```powershell
# Morning - Start VM
.\PHIS-Master.ps1 -Command Start

# Check status
.\PHIS-Master.ps1 -Command Status

# Connect for maintenance
.\PHIS-Master.ps1 -Command Connect

# Evening - Stop VM to save costs
.\PHIS-Master.ps1 -Command Stop
```

### Example 4: Troubleshooting
```powershell
# Run diagnostics
.\PHIS-Master.ps1 -Command Diagnose

# Check logs
.\PHIS-Master.ps1 -Command Logs

# Test SSH connectivity
.\PHIS-Master.ps1 -Command TestSSHKeys
```

## 🔍 Troubleshooting

### Common Issues

**"Azure module not found"**
```powershell
# Install as admin
Install-Module -Name Az -Force

# Or for current user
Install-Module -Name Az -Scope CurrentUser
```

**"No SSH key found"**
```powershell
# Generate through script
.\PHIS-Master.ps1 -Command GenerateSSHKey

# Or manually
ssh-keygen -t ed25519 -a 100
```

**"Cannot connect to VM"**
```powershell
# Check VM status
.\PHIS-Master.ps1 -Command Status

# Verify SSH keys
.\PHIS-Master.ps1 -Command TestSSHKeys

# Check network rules
.\PHIS-Master.ps1 -Command OpenPorts
```

**"PHIS not accessible"**
```powershell
# Check service logs
.\PHIS-Master.ps1 -Command Logs

# Connect and check Docker
.\PHIS-Master.ps1 -Command Connect
# Then run: sudo docker ps -a
```

## 🛡️ Security Best Practices

1. **Change default passwords immediately**
2. **Restrict SSH access** to your IP in Azure NSG
3. **Regular updates**: Keep system and containers updated
4. **Backup**: Create VM snapshots before major changes
5. **Monitor**: Set up Azure alerts for VM health

## 📝 Advanced Configuration

### Custom Parameters File
Create `phis-config.json` for repeated deployments:
```json
{
    "VMName": "phis-prod",
    "ResourceGroupName": "RG-PHIS-PROD",
    "Location": "eastus",
    "AdminUsername": "phisadmin"
}
```

Then use:
```powershell
$config = Get-Content phis-config.json | ConvertFrom-Json
.\PHIS-Master.ps1 -Command FullInstall @config
```

### Automation Examples
```powershell
# Scheduled VM start (Task Scheduler)
.\PHIS-Master.ps1 -Command Start

# Backup before updates
.\PHIS-Master.ps1 -Command Stop
# Create snapshot in Azure Portal
.\PHIS-Master.ps1 -Command Start
```

## 🎉 Migration from Old Scripts

If you were using the old scripts, here's the migration guide:

| Old Command | New Command |
|-------------|-------------|
| `.\Deploy-AzurePHISVM.ps1` | `.\PHIS-Master.ps1 -Command Deploy` |
| `.\Install-PHIS.ps1` | `.\PHIS-Master.ps1 -Command FullInstall` |
| `.\Manage-AzurePHISVM.ps1 -Action Connect` | `.\PHIS-Master.ps1 -Command Connect` |
| `.\Test-PHISInstallation.ps1` | `.\PHIS-Master.ps1 -Command Diagnose` |
| `.\New-SSHKey.ps1` | `.\PHIS-Master.ps1 -Command GenerateSSHKey` |
| `.\Test-SSHKeys.ps1` | `.\PHIS-Master.ps1 -Command TestSSHKeys` |

## 📞 Support

If you encounter issues:

1. Run diagnostics: `.\PHIS-Master.ps1 -Command Diagnose`
2. Check logs: `.\PHIS-Master.ps1 -Command Logs`
3. Verify prerequisites are met
4. Ensure network connectivity
5. Check Azure subscription permissions

---

**Note**: This script creates a development/testing environment. For production deployments, implement additional security hardening, backup strategies, and monitoring.