# PHIS Installation Troubleshooting Guide

## 🚨 Common Issues and Solutions

### 1. Installation Freezes at "Testing SSH connection"

**Symptom**: The script hangs at `ℹ Testing SSH connection to X.X.X.X...`

**Solutions**:
```powershell
# Option 1: Skip SSH test
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest

# Option 2: Full install with skip
.\PHIS.ps1 -Command FullInstall -SkipSSHTest
```

### 2. Installation Freezes at "Test-NetConnection" During Reboot

**Symptom**: After dependencies install, the script hangs at `Test-NetConnection - X.X.X.X:22 [Attempting TCP connect]`

**Solutions**:
```powershell
# Option 1: Skip the automatic reboot
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipReboot

# Option 2: Skip both SSH test and reboot
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest -SkipReboot

# Option 3: Manual reboot after installation
.\PHIS.ps1 -Command Restart
```

### 3. SSH Connection Works Manually but Not in Script

**Symptom**: You can connect using option 5 (Connect to VM) but automated tests fail

**Solution**: The automated tests use stricter parameters. Skip them:
```powershell
# For new installation
.\PHIS.ps1 -Command FullInstall -SkipSSHTest

# For existing VM
.\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest
```

### 4. VM Not Accessible After Deployment

**Symptom**: Can't connect to VM after creation

**Solutions**:
```powershell
# 1. Check VM status
.\PHIS.ps1 -Command Status

# 2. Check if ports are open
.\PHIS.ps1 -Command OpenPorts

# 3. Run SSH diagnostics
.\PHIS.ps1 -Command TestSSH

# 4. Try manual connection
.\PHIS.ps1 -Command Connect
```

### 5. Docker Commands Fail After Installation

**Symptom**: Docker commands fail with permission errors

**Solution**: The VM needs to be rebooted for Docker group changes:
```powershell
# Restart the VM
.\PHIS.ps1 -Command Restart

# Wait a minute, then reconnect
.\PHIS.ps1 -Command Connect
```

## 🛠️ Step-by-Step Troubleshooting Process

### For Complete Installation Issues:

1. **Deploy VM First**
   ```powershell
   .\PHIS.ps1 -Command Deploy
   ```

2. **Test Connection**
   ```powershell
   # Wait 2-3 minutes after deployment
   .\PHIS.ps1 -Command Connect
   ```

3. **If Connection Works, Install with Skips**
   ```powershell
   .\PHIS.ps1 -Command Install -VMIPAddress "YOUR_IP" -SkipSSHTest -SkipReboot
   ```

4. **Manually Reboot When Ready**
   ```powershell
   .\PHIS.ps1 -Command Restart
   ```

5. **Verify Installation**
   ```powershell
   .\PHIS.ps1 -Command Status
   ```

### For Connection Issues:

1. **Run Diagnostics**
   ```powershell
   .\PHIS.ps1 -Command TestSSH
   ```

2. **Check Network**
   ```powershell
   .\PHIS.ps1 -Command OpenPorts
   ```

3. **Verify SSH Keys**
   ```powershell
   .\PHIS.ps1 -Command TestSSHKeys
   ```

4. **Try Manual SSH**
   ```powershell
   # Get the exact SSH command
   .\PHIS.ps1 -Command ShowInfo
   ```

## 🔍 Diagnostic Commands

```powershell
# Full system diagnostic
.\PHIS.ps1 -Command Diagnose

# SSH connection testing
.\PHIS.ps1 -Command TestSSH

# Check VM and ports
.\PHIS.ps1 -Command Status
.\PHIS.ps1 -Command OpenPorts

# View PHIS logs
.\PHIS.ps1 -Command Logs
```

## 💡 Prevention Tips

1. **Always test manual connection first** before running automated installation
2. **Use skip flags** if you know manual connection works
3. **Wait sufficient time** after VM deployment (2-3 minutes)
4. **Check Azure portal** for VM status if unsure

## 🆘 When All Else Fails

If you're still having issues:

1. **Manual Installation Path**:
   ```bash
   # Connect to VM
   ssh -i ~/.ssh/id_ed25519 azureuser@YOUR_IP
   
   # Run installation scripts manually
   wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-dependencies.sh
   chmod +x openSILEX-dependencies.sh
   ./openSILEX-dependencies.sh
   
   # Reboot
   sudo reboot
   
   # Reconnect and install PHIS
   wget https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-installer.sh
   chmod +x openSILEX-installer.sh
   ./openSILEX-installer.sh
   ```

2. **Check Azure Resources**:
   - VM is running
   - Network Security Group has correct rules
   - Public IP is assigned
   - No Azure service issues

3. **Verify Prerequisites**:
   - Azure PowerShell module installed
   - Valid SSH keys exist
   - Correct permissions on SSH key files

## 📞 Getting Help

If problems persist:
1. Run `.\PHIS.ps1 -Command Diagnose` and save output
2. Check Azure portal for VM status
3. Verify all prerequisites are met
4. Document the exact error messages and steps taken