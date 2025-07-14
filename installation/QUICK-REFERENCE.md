# PHIS Master Controller - Quick Reference

## 🚀 Most Common Commands

```powershell
# Interactive Menu (Recommended for beginners)
.\PHIS.ps1

# Complete Installation (VM + PHIS)
.\PHIS.ps1 -Command FullInstall

# Complete Installation (Skip SSH test if having issues)
.\PHIS.ps1 -Command FullInstall -SkipSSHTest

# Install on Existing VM
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP"

# Check Status
.\PHIS.ps1 -Command Status

# Connect via SSH
.\PHIS.ps1 -Command Connect

# View Logs
.\PHIS.ps1 -Command Logs
```

## 🆘 Installation Troubleshooting

If installation is freezing or having issues:

```powershell
# Skip SSH test
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest

# Skip automatic reboot
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipReboot

# Skip both SSH test and reboot
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest -SkipReboot

# Skip everything and just install PHIS
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipDependencies

# Manual reboot after skipping
.\PHIS.ps1 -Command Restart
```

## 👥 User Management

```powershell
# Create User (Interactive)
.\PHIS.ps1 -Command CreateUser

# Create User (Command Line)
.\PHIS.ps1 -Command CreateUser `
    -UserEmail "user@example.com" `
    -UserFirstName "John" `
    -UserLastName "Doe" `
    -UserPassword "SecurePass123" `
    -UserIsAdmin

# List All Users
.\PHIS.ps1 -Command ListUsers
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

# Test SSH Connection (Detailed)
.\PHIS.ps1 -Command TestSSH

# Test SSH Keys
.\PHIS.ps1 -Command TestSSHKeys

# Generate New SSH Key
.\PHIS.ps1 -Command GenerateSSHKey

# Check Open Ports
.\PHIS.ps1 -Command OpenPorts
```

## 🆘 Common Issues & Solutions

### SSH Connection Freezing
```powershell
# Skip the SSH test that might be hanging
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest
```

### Reboot Hanging (Test-NetConnection freeze)
```powershell
# Skip the automatic reboot
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipReboot

# Manually reboot later
.\PHIS.ps1 -Command Restart
```

### Complete Installation Issues
```powershell
# Full install with all skips
.\PHIS.ps1 -Command FullInstall -SkipSSHTest

# Or deploy and install separately
.\PHIS.ps1 -Command Deploy
# Wait, then test connection
.\PHIS.ps1 -Command Connect
# Then install with skips
.\PHIS.ps1 -Command Install -VMIPAddress "IP" -SkipSSHTest -SkipReboot
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

# Skip SSH Test
-SkipSSHTest

# Skip Reboot
-SkipReboot
```

## 📝 Example Workflows

### New Installation (with connection issues)
```powershell
# If standard install has issues
.\PHIS.ps1 -Command FullInstall -SkipSSHTest

# Or more control
.\PHIS.ps1 -Command Deploy
.\PHIS.ps1 -Command Connect  # Test manual connection
.\PHIS.ps1 -Command Install -VMIPAddress "IP" -SkipSSHTest -SkipReboot
.\PHIS.ps1 -Command Restart  # Manual reboot when ready
```

### User Management
```powershell
# After installation, create users
.\PHIS.ps1 -Command CreateUser  # Interactive wizard

# Or batch create
.\PHIS.ps1 -Command CreateUser -UserEmail "admin@org.com" -UserFirstName "Admin" -UserLastName "User" -UserPassword "Pass123!" -UserIsAdmin

# Check users
.\PHIS.ps1 -Command ListUsers
```

### Daily Use
```powershell
# Morning
.\PHIS.ps1 -Command Start
.\PHIS.ps1 -Command Status

# Work
.\PHIS.ps1 -Command Connect
.\PHIS.ps1 -Command CreateUser  # Add new team member

# Evening
.\PHIS.ps1 -Command Stop
```

### Troubleshooting Connection Issues
```powershell
.\PHIS.ps1 -Command TestSSH     # Detailed diagnostics
.\PHIS.ps1 -Command TestSSHKeys # Check key configuration
.\PHIS.ps1 -Command Diagnose    # General diagnostics
.\PHIS.ps1 -Command OpenPorts   # Check network rules
```

## 🆘 Need Help?

1. Use the interactive menu: `.\PHIS.ps1`
2. Get detailed help: `Get-Help .\PHIS.ps1 -Detailed`
3. Read the full README.md for comprehensive documentation