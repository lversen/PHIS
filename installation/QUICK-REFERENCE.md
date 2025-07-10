# PHIS Master Controller - Quick Reference

## 🚀 Most Common Commands

```powershell
# Interactive Menu (Recommended for beginners)
.\PHIS.ps1

# Complete Installation (VM + PHIS)
.\PHIS.ps1 -Command FullInstall

# Install on Existing VM
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP"

# Check Status
.\PHIS.ps1 -Command Status

# Connect via SSH
.\PHIS.ps1 -Command Connect

# View Logs
.\PHIS.ps1 -Command Logs
```

## 💾 VM Management

```powershell
# Start VM
.\PHIS.ps1 -Command Start

# Stop VM (save costs)
.\PHIS.ps1 -Command Stop

# Restart VM
.\PHIS.ps1 -Command Restart

# Get VM IP
.\PHIS.ps1 -Command GetIP

# Delete Everything
.\PHIS.ps1 -Command Delete
```

## 🔧 Troubleshooting

```powershell
# Run Diagnostics
.\PHIS.ps1 -Command Diagnose

# Test SSH Keys
.\PHIS.ps1 -Command TestSSHKeys

# Generate New SSH Key
.\PHIS.ps1 -Command GenerateSSHKey

# Check Open Ports
.\PHIS.ps1 -Command OpenPorts
```

## 🌐 Access URLs

After installation, access PHIS at:
- **Web Interface**: `http://YOUR_VM_IP:28081/phis/app/`
- **API Docs**: `http://YOUR_VM_IP:28081/phis/swagger-ui.html`
- **Default Login**: `admin@opensilex.org` / `admin`

⚠️ **Change the default password immediately!**

## 🎯 Custom Options

```powershell
# Custom VM Name
-VMName "phis-dev"

# Custom Resource Group
-ResourceGroupName "RG-PHIS-DEV"

# Different Region
-Location "eastus"

# Custom SSH Key
-SSHKeyPath "C:\keys\mykey"

# Skip Dependencies
-SkipDependencies
```

## 📝 Example Workflows

### New Installation
```powershell
.\PHIS.ps1 -Command FullInstall
```

### Daily Use
```powershell
# Morning
.\PHIS.ps1 -Command Start
.\PHIS.ps1 -Command Status

# Work
.\PHIS.ps1 -Command Connect

# Evening
.\PHIS.ps1 -Command Stop
```

### Troubleshooting
```powershell
.\PHIS.ps1 -Command Diagnose
.\PHIS.ps1 -Command Logs
.\PHIS.ps1 -Command TestSSHKeys
```

## 🆘 Need Help?

1. Use the interactive menu: `.\PHIS.ps1`
2. Get detailed help: `Get-Help .\PHIS.ps1 -Detailed`
3. Read the full README.md for comprehensive documentation