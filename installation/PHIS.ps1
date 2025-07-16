#Requires -Version 5.1
<#
.SYNOPSIS
    Unified PHIS installation, deployment, and management script for Azure.

.DESCRIPTION
    This master script combines all PHIS-related functionality:
    - Azure VM deployment
    - PHIS installation
    - VM management (start/stop/connect)
    - SSH key generation and testing
    - Diagnostics and troubleshooting
    - User account management
    - Interactive menu system

.PARAMETER Command
    The command to execute:
    - Menu: Interactive menu (default)
    - Deploy: Create new Azure VM
    - Install: Install PHIS on VM
    - FullInstall: Deploy VM + Install PHIS
    - Connect: SSH to VM
    - Status: Check installation status
    - Start/Stop/Restart: VM power management
    - Delete: Remove all resources
    - Diagnose: Run diagnostics
    - GenerateSSHKey: Create new SSH key
    - TestSSHKeys: Check SSH keys
    - TestSSH: Test SSH connectivity with detailed diagnostics
    - CreateUser: Create new PHIS user account
    - ListUsers: List all PHIS users

.PARAMETER VMName
    Name of the VM (default: phis)

.PARAMETER ResourceGroupName
    Azure resource group name (default: RG-PHIS)

.PARAMETER VMIPAddress
    IP address for existing VM operations

.PARAMETER Location
    Azure region (default: westeurope)

.PARAMETER AdminUsername
    SSH username (default: azureuser)

.PARAMETER SkipDependencies
    Skip dependency installation

.PARAMETER SkipSSHTest
    Skip the SSH connection test and proceed with installation

.PARAMETER SkipReboot
    Skip the VM reboot after dependency installation

.EXAMPLE
    .\PHIS.ps1
    # Opens interactive menu

.EXAMPLE
    .\PHIS.ps1 -Command FullInstall
    # Complete installation

.EXAMPLE
    .\PHIS.ps1 -Command Install -VMIPAddress "20.50.100.200"
    # Install on existing VM

.EXAMPLE
    .\PHIS.ps1 -Command CreateUser
    # Create a new PHIS user account

.EXAMPLE
    .\PHIS.ps1 -Command TestSSH
    # Test SSH connectivity with detailed diagnostics
#>

[CmdletBinding()]
param(
    [ValidateSet('Menu', 'Deploy', 'Install', 'FullInstall', 'Connect', 'Status', 
                 'Start', 'Stop', 'Restart', 'Delete', 'Diagnose', 'GenerateSSHKey', 
                 'TestSSHKeys', 'ShowInfo', 'GetIP', 'OpenPorts', 'Logs', 'CreateUser', 'ListUsers', 'TestSSH')]
    [string]$Command = 'Menu',
    
    [string]$VMName = "phis-test",
    [string]$ResourceGroupName = "RG-PHIS-TEST",
    [string]$VMIPAddress,
    [string]$Location = "westeurope",
    [string]$AdminUsername = "azureuser",
    [string]$SSHKeyPath,
    [string]$TemplateFile = "template-vm.json",
    [switch]$SkipDependencies,
    [switch]$SkipPrerequisiteCheck,
    [switch]$SkipSSHTest,
    [switch]$SkipReboot,
    [switch]$DebugSSHKeys,
    [switch]$NoPassphrase,
    [string]$KeyType = "ed25519",
    [string]$KeyName,
    # User creation parameters
    [string]$UserEmail,
    [string]$UserFirstName,
    [string]$UserLastName,
    [string]$UserPassword,
    [switch]$UserIsAdmin,
    [string]$UserLanguage = "en"
)

# Script configuration
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$script:ConnectionInfoFile = "phis-vm-connection-info.json"

# Remote script URLs
$script:DependenciesScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-dependencies.sh"
$script:InstallerScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/openSILEX-installer.sh"
$script:ManagerScriptURL = "https://raw.githubusercontent.com/lversen/PHIS/main/opensilex-manager.sh"

#region Color Output Functions
function Write-ColorOutput {
    param([string]$Message, [ConsoleColor]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Write-Success { Write-ColorOutput "✓ $($args[0])" Green }
function Write-Info { Write-ColorOutput "ℹ $($args[0])" Cyan }
function Write-Warning { Write-ColorOutput "⚠ $($args[0])" Yellow }
function Write-Error { Write-ColorOutput "✗ $($args[0])" Red }
function Write-Step { 
    Write-Host "`n" -NoNewline
    Write-ColorOutput "▶ $($args[0])" Magenta 
}
#endregion

#region Banner Functions
function Show-Banner {
    Clear-Host
    Write-Host @"

    ╔═══════════════════════════════════════════════════════════════╗
    ║                     PHIS Master Controller                     ║
    ║                                                                ║
    ║  Complete solution for PHIS deployment and management          ║
    ╚═══════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan
}

function Show-Menu {
    Show-Banner
    
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    
    if ($isAdmin) {
        Write-Host "  Running as Administrator" -ForegroundColor Green
    } else {
        Write-Host "  Running as User (some operations may require admin)" -ForegroundColor Yellow
    }
    
    Write-Host "`n━━━ Installation Options ━━━" -ForegroundColor Yellow
    Write-Host "  1. " -NoNewline; Write-Host "Complete Installation (New VM + PHIS)" -ForegroundColor White
    Write-Host "  2. " -NoNewline; Write-Host "Install on Existing VM" -ForegroundColor White
    Write-Host "  3. " -NoNewline; Write-Host "Create Azure VM Only" -ForegroundColor White
    
    Write-Host "`n━━━ Management Options ━━━" -ForegroundColor Yellow
    Write-Host "  4. " -NoNewline; Write-Host "Check Installation Status" -ForegroundColor White
    Write-Host "  5. " -NoNewline; Write-Host "Connect to VM (SSH)" -ForegroundColor White
    Write-Host "  6. " -NoNewline; Write-Host "VM Power Management" -ForegroundColor White
    Write-Host "  7. " -NoNewline; Write-Host "View Service Logs" -ForegroundColor White
    Write-Host "  8. " -NoNewline; Write-Host "Delete All Resources" -ForegroundColor White
    
    Write-Host "`n━━━ User Management ━━━" -ForegroundColor Yellow
    Write-Host "  9. " -NoNewline; Write-Host "Create New User" -ForegroundColor White
    Write-Host " 10. " -NoNewline; Write-Host "List All Users" -ForegroundColor White
    
    Write-Host "`n━━━ Utilities ━━━" -ForegroundColor Yellow
    Write-Host " 11. " -NoNewline; Write-Host "Run Diagnostics" -ForegroundColor White
    Write-Host " 12. " -NoNewline; Write-Host "Generate SSH Key" -ForegroundColor White
    Write-Host " 13. " -NoNewline; Write-Host "Test SSH Keys" -ForegroundColor White
    Write-Host " 14. " -NoNewline; Write-Host "Install Azure PowerShell Module" -ForegroundColor White
    Write-Host " 15. " -NoNewline; Write-Host "Show VM Information" -ForegroundColor White
    
    Write-Host "`n  0. " -NoNewline; Write-Host "Exit" -ForegroundColor Red
    Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
}
#endregion

#region Network Testing Functions
function Test-Port {
    param(
        [string]$ComputerName,
        [int]$Port,
        [int]$Timeout = 3
    )
    
    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $connect = $tcpClient.BeginConnect($ComputerName, $Port, $null, $null)
        $wait = $connect.AsyncWaitHandle.WaitOne($Timeout * 1000, $false)
        
        if ($wait) {
            try {
                $tcpClient.EndConnect($connect)
                $tcpClient.Close()
                return $true
            }
            catch {
                return $false
            }
        }
        else {
            $tcpClient.Close()
            return $false
        }
    }
    catch {
        return $false
    }
}
#endregion

#region SSH Key Functions
function Test-Port {
    param(
        [string]$ComputerName,
        [int]$Port,
        [int]$Timeout = 3
    )
    
    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $connect = $tcpClient.BeginConnect($ComputerName, $Port, $null, $null)
        $wait = $connect.AsyncWaitHandle.WaitOne($Timeout * 1000, $false)
        
        if ($wait) {
            try {
                $tcpClient.EndConnect($connect)
                $tcpClient.Close()
                return $true
            }
            catch {
                return $false
            }
        }
        else {
            $tcpClient.Close()
            return $false
        }
    }
    catch {
        return $false
    }
}

function Find-SSHKeys {
    Write-Info "Searching for SSH public keys..."
    
    $sshPaths = @(
        "$env:USERPROFILE\.ssh",
        "$env:HOMEDRIVE$env:HOMEPATH\.ssh",
        "$HOME\.ssh"
    )
    
    $foundKeys = @()
    
    foreach ($path in $sshPaths | Where-Object { Test-Path $_ }) {
        if ($DebugSSHKeys) {
            Write-Info "Searching in: $path"
        }
        
        $pubKeys = Get-ChildItem -Path $path -Filter "*.pub" -ErrorAction SilentlyContinue
        
        foreach ($key in $pubKeys) {
            if ($key.Name -match "known_hosts") { continue }
            
            try {
                $keyContent = Get-Content $key.FullName -Raw -ErrorAction Stop
                
                if ($keyContent -match "^(ssh-rsa|ssh-ed25519|ecdsa-sha2|ssh-dss)") {
                    $keyType = switch -Regex ($keyContent) {
                        "^ssh-ed25519" { "ED25519" }
                        "^ssh-rsa" { "RSA" }
                        "^ecdsa-sha2" { "ECDSA" }
                        "^ssh-dss" { "DSA" }
                        default { "Unknown" }
                    }
                    
                    $foundKeys += [PSCustomObject]@{
                        Path = $key.FullName
                        Type = $keyType
                        Content = $keyContent.Trim()
                        Name = $key.Name
                    }
                }
            }
            catch {
                Write-Warning "Could not read key file: $($key.FullName)"
            }
        }
    }
    
    return $foundKeys | Group-Object -Property Content | ForEach-Object { $_.Group[0] }
}

function Select-SSHKey {
    param($Keys)
    
    if ($Keys.Count -eq 0) {
        Write-Error "No SSH public keys found! Please generate an SSH key first."
        Write-Info "To generate a new SSH key, run:"
        Write-Info "  .\PHIS.ps1 -Command GenerateSSHKey"
        return $null
    }
    
    if ($Keys.Count -eq 1) {
        Write-Success "Found 1 SSH public key: $($Keys[0].Path)"
        return $Keys[0]
    }
    
    Write-Info "Found $($Keys.Count) SSH public keys:"
    for ($i = 0; $i -lt $Keys.Count; $i++) {
        Write-Host "[$($i+1)] $($Keys[$i].Name) (Type: $($Keys[$i].Type))"
        Write-Host "    Path: $($Keys[$i].Path)" -ForegroundColor Gray
    }
    
    do {
        $selection = Read-Host "`nSelect key number (1-$($Keys.Count))"
        try {
            $index = [int]$selection - 1
            $valid = $index -ge 0 -and $index -lt $Keys.Count
        } catch {
            $valid = $false
        }
    } while (-not $valid)
    
    return $Keys[$index]
}

function Find-SSHPrivateKey {
    param([string]$ProvidedPath)
    
    if ($ProvidedPath -and (Test-Path $ProvidedPath)) {
        return $ProvidedPath
    }
    
    $sshPaths = @(
        "$env:USERPROFILE\.ssh\id_ed25519",
        "$env:USERPROFILE\.ssh\id_rsa",
        "$env:USERPROFILE\.ssh\id_ecdsa",
        "$HOME/.ssh/id_ed25519",
        "$HOME/.ssh/id_rsa"
    )
    
    foreach ($path in $sshPaths) {
        if (Test-Path $path) {
            Write-Info "Found SSH key: $path"
            return $path
        }
    }
    
    Write-Error "No SSH private key found"
    return $null
}

function New-SSHKeyPair {
    Write-Step "Generating SSH Key"
    
    $sshKeygen = Get-Command ssh-keygen -ErrorAction SilentlyContinue
    if (-not $sshKeygen) {
        Write-Error "ssh-keygen not found! Install OpenSSH client."
        return
    }
    
    $sshDir = "$env:USERPROFILE\.ssh"
    if (-not (Test-Path $sshDir)) {
        New-Item -ItemType Directory -Path $sshDir -Force | Out-Null
    }
    
    if (-not $KeyName) {
        $KeyName = "id_$KeyType"
    }
    
    $keyPath = Join-Path $sshDir $KeyName
    if (Test-Path $keyPath) {
        Write-Warning "Key already exists: $keyPath"
        $overwrite = Read-Host "Overwrite? (Y/N)"
        if ($overwrite -ne 'Y') {
            return
        }
    }
    
    $keyParams = switch ($KeyType) {
        "ed25519" { @("-t", "ed25519", "-a", "100") }
        "rsa"     { @("-t", "rsa", "-b", "4096") }
        "ecdsa"   { @("-t", "ecdsa", "-b", "521") }
    }
    
    $keyParams += @("-f", $keyPath, "-C", "$env:USERNAME@$env:COMPUTERNAME")
    
    if ($NoPassphrase) {
        $keyParams += @("-N", '""')
    }
    
    Write-Info "Generating $KeyType SSH key at $keyPath..."
    
    $process = Start-Process -FilePath "ssh-keygen" -ArgumentList $keyParams -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Success "SSH key generated successfully!"
        
        $pubKeyPath = "$keyPath.pub"
        if (Test-Path $pubKeyPath) {
            $pubKey = Get-Content $pubKeyPath
            Write-Info "`nYour public key:"
            Write-Host $pubKey -ForegroundColor Yellow
            
            try {
                $pubKey | Set-Clipboard
                Write-Success "Public key copied to clipboard!"
            } catch {}
        }
    }
}

function Test-SSHKeyConfiguration {
    Write-Step "SSH Key Diagnostic"
    
    $sshPaths = @(
        "$env:USERPROFILE\.ssh",
        "$env:HOMEDRIVE$env:HOMEPATH\.ssh",
        "$HOME\.ssh"
    ) | Select-Object -Unique
    
    Write-Info "Checking SSH directories..."
    foreach ($path in $sshPaths) {
        if (Test-Path $path) {
            Write-Success "Found: $path"
            $files = Get-ChildItem -Path $path -Force
            foreach ($file in $files) {
                $icon = if ($file.PSIsContainer) { "📁" } else { "📄" }
                Write-Host "    $icon $($file.Name)" -ForegroundColor Gray
            }
        } else {
            Write-Warning "Not found: $path"
        }
    }
    
    $foundKeys = Find-SSHKeys
    
    if ($foundKeys.Count -eq 0) {
        Write-Warning "`nNo SSH public keys found!"
        Write-Info "Generate a new key with: .\PHIS.ps1 -Command GenerateSSHKey"
    } else {
        Write-Success "`nFound $($foundKeys.Count) SSH public key(s):"
        
        foreach ($key in $foundKeys) {
            Write-Host "`n  Key: $($key.Name)" -ForegroundColor Green
            Write-Host "  Type: $($key.Type)"
            Write-Host "  Path: $($key.Path)"
            
            $privateKeyPath = $key.Path -replace '\.pub$', ''
            if (Test-Path $privateKeyPath) {
                Write-Success "  ✓ Private key exists"
            } else {
                Write-Warning "  ✗ Private key missing!"
            }
        }
    }
}
#endregion

#region Azure Functions
function Test-Prerequisites {
    Write-Info "Checking prerequisites..."
    
    if (-not (Get-Module -ListAvailable -Name Az)) {
        Write-Error "Azure PowerShell module not found!"
        Write-Info "Install with: Install-Module -Name Az -Repository PSGallery -Force"
        return $false
    }
    
    if (-not (Test-Path $TemplateFile)) {
        Write-Error "Template file not found: $TemplateFile"
        return $false
    }
    
    Write-Success "Prerequisites check passed"
    return $true
}

function Connect-AzureAccount {
    Write-Info "Checking Azure connection..."
    
    try {
        $context = Get-AzContext
        if ($null -eq $context) {
            Write-Info "Not connected to Azure. Initiating login..."
            Connect-AzAccount
        } else {
            Write-Success "Connected as: $($context.Account)"
        }
        return $true
    }
    catch {
        Write-Error "Failed to connect to Azure: $_"
        return $false
    }
}

function New-ResourceGroupIfNotExists {
    param($Name, $Location)
    
    Write-Info "Checking resource group..."
    $rg = Get-AzResourceGroup -Name $Name -ErrorAction SilentlyContinue
    
    if ($null -eq $rg) {
        Write-Info "Creating resource group: $Name in $Location"
        New-AzResourceGroup -Name $Name -Location $Location | Out-Null
        Write-Success "Resource group created"
    } else {
        Write-Success "Resource group exists: $Name"
    }
}

function Deploy-PHISVM {
    Write-Step "Deploying Azure VM"
    
    if (-not $SkipPrerequisiteCheck) {
        if (-not (Test-Prerequisites)) { return $null }
    }
    
    $sshKeys = Find-SSHKeys
    $selectedKey = Select-SSHKey -Keys $sshKeys
    if (-not $selectedKey) { return $null }
    
    if (-not (Connect-AzureAccount)) { return $null }
    
    New-ResourceGroupIfNotExists -Name $ResourceGroupName -Location $Location
    
    # Check for existing VM
    $existingVM = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -ErrorAction SilentlyContinue
    if ($existingVM) {
        Write-Warning "VM '$VMName' already exists!"
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip" -ErrorAction SilentlyContinue).IpAddress
        
        if ($publicIP) {
            Write-Success "Existing VM Public IP: $publicIP"
            return @{
                VMName = $VMName
                ResourceGroup = $ResourceGroupName
                PublicIP = $publicIP
                AdminUsername = $AdminUsername
            }
        }
    }
    
    $deploymentParams = @{
        vmName = $VMName
        adminUsername = $AdminUsername
        sshPublicKey = $selectedKey.Content
    }
    
    Write-Info "Deploying VM (this may take 5-10 minutes)..."
    $deploymentName = "phis-deployment-$(Get-Date -Format 'yyyyMMddHHmmss')"
    
    try {
        $deployment = New-AzResourceGroupDeployment `
            -Name $deploymentName `
            -ResourceGroupName $ResourceGroupName `
            -TemplateFile $TemplateFile `
            -TemplateParameterObject $deploymentParams `
            -Verbose
        
        if ($deployment.ProvisioningState -eq "Succeeded") {
            Write-Success "Deployment completed successfully!"
            
            $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip").IpAddress
            
            $connectionInfo = @{
                VMName = $VMName
                ResourceGroup = $ResourceGroupName
                PublicIP = $publicIP
                AdminUsername = $AdminUsername
                SSHKeyPath = $selectedKey.Path -replace '\.pub$',''
                DeploymentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            }
            
            $connectionInfo | ConvertTo-Json | Out-File $script:ConnectionInfoFile
            
            return $connectionInfo
        }
    }
    catch {
        Write-Error "Deployment error: $_"
    }
    
    return $null
}
#endregion

#region VM Management Functions
function Get-ConnectionInfo {
    if (Test-Path $script:ConnectionInfoFile) {
        return Get-Content $script:ConnectionInfoFile | ConvertFrom-Json
    }
    
    if ($VMIPAddress) {
        return @{
            PublicIP = $VMIPAddress
            AdminUsername = $AdminUsername
            VMName = $VMName
            ResourceGroup = $ResourceGroupName
        }
    }
    
    return $null
}

function Get-VMStatus {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Info "Checking VM status..."
    try {
        $vm = Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Status
        $powerState = ($vm.Statuses | Where-Object { $_.Code -like "PowerState/*" }).DisplayStatus
        
        Write-Info "VM Name: $VMName"
        Write-Info "Power State: $powerState"
        
        $publicIP = (Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName -Name "$VMName-ip" -ErrorAction SilentlyContinue).IpAddress
        if ($publicIP) {
            Write-Info "Public IP: $publicIP"
        }
        
        return $powerState
    }
    catch {
        Write-Error "Failed to get VM status: $_"
    }
}

function Start-PHISVM {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Info "Starting VM..."
    try {
        Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
        Write-Success "VM started successfully"
    }
    catch {
        Write-Error "Failed to start VM: $_"
    }
}

function Stop-PHISVM {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Warning "This will deallocate the VM to save costs."
    $confirm = Read-Host "Continue? (Y/N)"
    
    if ($confirm -eq 'Y') {
        Write-Info "Stopping VM..."
        try {
            Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Force
            Write-Success "VM stopped successfully"
        }
        catch {
            Write-Error "Failed to stop VM: $_"
        }
    }
}

function Restart-PHISVM {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Info "Restarting VM..."
    try {
        Restart-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName
        Write-Success "VM restarted successfully"
    }
    catch {
        Write-Error "Failed to restart VM: $_"
    }
}

function Remove-PHISResources {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Warning "This will permanently delete the VM and all associated resources!"
    Write-Warning "Resource Group: $ResourceGroupName"
    $confirm = Read-Host "Type 'DELETE' to confirm"
    
    if ($confirm -eq 'DELETE') {
        Write-Info "Deleting resource group and all resources..."
        try {
            Remove-AzResourceGroup -Name $ResourceGroupName -Force
            Write-Success "Resources deleted successfully"
            
            if (Test-Path $script:ConnectionInfoFile) {
                Remove-Item $script:ConnectionInfoFile
            }
        }
        catch {
            Write-Error "Failed to delete resources: $_"
        }
    }
}

function Show-OpenPorts {
    if (-not (Connect-AzureAccount)) { return }
    
    Write-Info "Checking Network Security Group rules..."
    try {
        $nsg = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName -Name "$VMName-nsg"
        
        Write-Info "`nInbound Security Rules:"
        $nsg.SecurityRules | Where-Object { $_.Direction -eq "Inbound" } | 
            Sort-Object Priority |
            Format-Table -Property Name, Priority, SourceAddressPrefix, DestinationPortRange, Access -AutoSize
    }
    catch {
        Write-Error "Failed to get NSG rules: $_"
    }
}
#endregion

#region SSH Functions
function Test-SSHConnection {
    param(
        [string]$IPAddress,
        [string]$Username,
        [string]$KeyPath,
        [switch]$Simple
    )
    
    Write-Info "Testing SSH connection to $IPAddress..."
    
    # First try a simple port test using our custom function
    Write-Info "Checking if SSH port 22 is open..."
    $portTest = Test-Port -ComputerName $IPAddress -Port 22 -Timeout 5
    
    if (-not $portTest) {
        Write-Warning "SSH port 22 is not accessible"
        return $false
    }
    
    Write-Success "SSH port 22 is open"
    
    # If simple mode, just return true if port is open
    if ($Simple) {
        Write-Info "Port is open, assuming SSH is ready (simple mode)"
        return $true
    }
    
    # Try a simpler SSH test without BatchMode
    $sshArgs = @(
        "-o", "StrictHostKeyChecking=no"
        "-o", "ConnectTimeout=10"
        "-o", "UserKnownHostsFile=/dev/null"
        "-i", $KeyPath
        "$Username@$IPAddress"
        "echo CONNECTION_SUCCESS"
    )
    
    try {
        Write-Info "Attempting SSH connection (this may take a few seconds)..."
        
        # Create a temporary file for output
        $tempOut = [System.IO.Path]::GetTempFileName()
        $tempErr = [System.IO.Path]::GetTempFileName()
        
        $process = Start-Process -FilePath "ssh" -ArgumentList $sshArgs `
                                -NoNewWindow -Wait -PassThru `
                                -RedirectStandardOutput $tempOut `
                                -RedirectStandardError $tempErr
        
        $output = Get-Content $tempOut -ErrorAction SilentlyContinue
        $errors = Get-Content $tempErr -ErrorAction SilentlyContinue
        
        # Clean up temp files
        Remove-Item $tempOut, $tempErr -ErrorAction SilentlyContinue
        
        if ($process.ExitCode -eq 0 -or $output -match "CONNECTION_SUCCESS") {
            Write-Success "SSH connection successful"
            return $true
        } else {
            Write-Warning "SSH connection test failed (exit code: $($process.ExitCode))"
            if ($errors) {
                Write-Info "SSH errors: $($errors | Select-Object -First 3 | Out-String)"
            }
        }
    }
    catch {
        Write-Warning "SSH connection test error: $_"
    }
    
    Write-Warning "SSH connection test failed"
    return $false
}

function Invoke-SSHCommand {
    param(
        [string]$IPAddress,
        [string]$Username,
        [string]$KeyPath,
        [string]$Command,
        [switch]$ShowOutput = $true
    )
    
    try {
        if ($ShowOutput) {
            & ssh -o StrictHostKeyChecking=no -i $KeyPath "$Username@$IPAddress" $Command
        }
        else {
            $result = & ssh -o StrictHostKeyChecking=no -i $KeyPath "$Username@$IPAddress" $Command 2>&1
            return $result
        }
    }
    catch {
        Write-Warning "SSH command execution failed: $_"
        return $null
    }
}

function Connect-VM {
    $info = Get-ConnectionInfo
    if (-not $info) {
        Write-Error "No connection info found"
        return
    }
    
    $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) { return }
    
    Write-Info "Connecting to VM at $($info.PublicIP)..."
    $sshCommand = "ssh -i `"$sshKey`" $($info.AdminUsername)@$($info.PublicIP)"
    
    Write-Success "Executing: $sshCommand"
    Invoke-Expression $sshCommand
}
#endregion

#region Installation Functions
function Install-Dependencies {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Installing system dependencies"
    
    Write-Info "Downloading and running dependencies script..."
    # Pipe 'N' to the script to automatically decline the optional VS Code installation
    $cmd = "wget -q -O ~/openSILEX-dependencies.sh '$script:DependenciesScriptURL' && chmod +x ~/openSILEX-dependencies.sh && echo 'N' | ./openSILEX-dependencies.sh"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername -KeyPath $KeyPath -Command $cmd
    
    Write-Success "Dependencies installed"
}

function Install-PHIS {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Installing PHIS/OpenSILEX"
    
    Write-Info "Downloading installer scripts..."
    $downloadCmd = @"
wget -q -O ~/openSILEX-installer.sh '$script:InstallerScriptURL' && chmod +x ~/openSILEX-installer.sh && 
wget -q -O ~/opensilex-manager.sh '$script:ManagerScriptURL' && chmod +x ~/opensilex-manager.sh
"@
    
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $downloadCmd -ShowOutput:$false
    
    Write-Info "Running PHIS installation (this will take several minutes)..."
    
    $installCmd = "cd ~ && sudo -E bash -c './openSILEX-installer.sh'"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $installCmd
    
    Write-Success "PHIS installation completed"
}

function Get-InstallationStatus {
    param($ConnectionInfo, [string]$KeyPath)
    
    Write-Step "Checking PHIS installation status"
    
    Write-Info "Docker containers status:"
    $dockerCmd = "sudo docker ps -a --format 'table {{.Names}}\t{{.Status}}'"
    Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                      -KeyPath $KeyPath -Command $dockerCmd
    
    Write-Info "`nChecking PHIS web interface..."
    $checkCmd = "timeout 10 curl -s -o /dev/null -w '%{http_code}' http://localhost:28081/phis/app/ 2>/dev/null || echo 'Failed'"
    $result = Invoke-SSHCommand -IPAddress $ConnectionInfo.PublicIP -Username $ConnectionInfo.AdminUsername `
                                -KeyPath $KeyPath -Command $checkCmd -ShowOutput:$false
    
    if ($result -match "200") {
        Write-Success "PHIS web interface is accessible"
    }
    else {
        Write-Warning "PHIS web interface is not responding"
    }
    
    Write-Info "`nAccess Information:"
    Write-Host "  Web Interface: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/app/" -ForegroundColor Green
    Write-Host "  API Documentation: " -NoNewline
    Write-Host "http://$($ConnectionInfo.PublicIP):28081/phis/swagger-ui.html" -ForegroundColor Green
    
    Write-Info "`nDefault Credentials:"
    Write-Host "  Username: admin@opensilex.org" -ForegroundColor Yellow
    Write-Host "  Password: admin" -ForegroundColor Yellow
    
    Write-Warning "Change the default password after first login!"
}

function Show-ServiceLogs {
    $info = Get-ConnectionInfo
    if (-not $info) {
        Write-Error "No connection info found"
        return
    }
    
    $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) { return }
    
    Write-Info "Fetching PHIS logs (Ctrl+C to stop)..."
    $cmd = "sudo docker logs opensilex-docker-opensilexapp --tail 100 -f"
    Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey -Command $cmd
}
#endregion

#region User Management Functions
function New-PHISUser {
    param(
        [string]$Email,
        [string]$FirstName,
        [string]$LastName,
        [string]$Password,
        [bool]$IsAdmin = $false,
        [string]$Language = "en"
    )
    
    $info = Get-ConnectionInfo
    if (-not $info) {
        Write-Error "No connection info found"
        return
    }
    
    $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) { return }
    
    Write-Step "Creating PHIS User"
    
    # Check if PHIS is running by checking the web interface
    Write-Info "Checking if PHIS service is running..."
    $checkCmd = "timeout 10 curl -s -o /dev/null -w '%{http_code}' http://localhost:28081/phis/app/ 2>/dev/null || echo 'Failed'"
    $serviceStatus = Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername `
                                       -KeyPath $sshKey -Command $checkCmd -ShowOutput:$false

    if ($serviceStatus -notmatch "200") {
        Write-Error "PHIS service is not responding. Please ensure the service is started and accessible."
        return
    }
    
    # Construct the JSON payload
    $groupsJson = if ($IsAdmin) { ',"groups":["ex:admins"]' } else { '' }
    # Using "" to escape quotes inside a double-quoted string for the final command
    $jsonPayload = "{""email"":""$Email"",""firstName"":""$FirstName"",""lastName"":""$LastName"",""password"":""$Password"",""language"":""$Language""$groupsJson}"

    # Construct the curl command to be executed on the remote server
    # We wrap the json payload in single quotes to prevent shell expansion on the remote side.
    $createUserCmd = "curl -X POST 'http://localhost:8082/rest/user' -H 'accept: application/json' -H 'Content-Type: application/json' -d '$jsonPayload' --write-out '%{http_code}' --silent --output /dev/null"

    Write-Info "Creating user: $Email"
    Write-Info "Name: $FirstName $LastName"
    Write-Info "Admin: $IsAdmin"
    Write-Info "Language: $Language"
    
    # Execute the command
    $result = Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername `
                               -KeyPath $sshKey -Command $createUserCmd -ShowOutput:$false
    
    # The result will be the HTTP status code
    if ($result -match "201") { # 201 Created
        Write-Success "User created successfully!"
        
        if ($IsAdmin) {
            Write-Warning "This user has admin privileges"
        }
        
        Write-Info "`nThe user can now log in at:"
        Write-Host "  http://$($info.PublicIP):28081/phis/app/" -ForegroundColor Green
    } else {
        Write-Error "Failed to create user. The user may already exist or there was an error. (Status: $result)"
    }
}

function Get-PHISUsers {
    $info = Get-ConnectionInfo
    if (-not $info) {
        Write-Error "No connection info found"
        return
    }
    
    $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) { return }
    
    Write-Step "Listing PHIS Users"
    
    # Check if container is running
    $checkCmd = "sudo docker ps | grep -q opensilex-docker-opensilexapp && echo 'RUNNING' || echo 'NOT_RUNNING'"
    $containerStatus = Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername `
                                       -KeyPath $sshKey -Command $checkCmd -ShowOutput:$false
    
    if ($containerStatus -notmatch "RUNNING") {
        Write-Error "PHIS container is not running. Please ensure the service is started."
        return
    }
    
    # List users
    $listCmd = "sudo docker exec opensilex-docker-opensilexapp bash -c '/home/opensilex/bin/opensilex.sh user list'"
    
    Write-Info "Fetching user list..."
    Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername `
                     -KeyPath $sshKey -Command $listCmd
}

function Start-UserCreationWizard {
    Write-Step "User Creation Wizard"
    
    # Get email
    do {
        $email = Read-Host "Enter email address"
        if ($email -match "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$") {
            $validEmail = $true
        } else {
            Write-Warning "Invalid email format. Please try again."
            $validEmail = $false
        }
    } while (-not $validEmail)
    
    # Get first name
    do {
        $firstName = Read-Host "Enter first name"
        if ($firstName.Trim() -ne "") {
            $validFirstName = $true
        } else {
            Write-Warning "First name cannot be empty."
            $validFirstName = $false
        }
    } while (-not $validFirstName)
    
    # Get last name
    do {
        $lastName = Read-Host "Enter last name"
        if ($lastName.Trim() -ne "") {
            $validLastName = $true
        } else {
            Write-Warning "Last name cannot be empty."
            $validLastName = $false
        }
    } while (-not $validLastName)
    
    # Get password
    do {
        $password = Read-Host "Enter password" -AsSecureString
        $confirmPassword = Read-Host "Confirm password" -AsSecureString
        
        # Convert SecureString to plain text for comparison
        $pwd1 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
        $pwd2 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($confirmPassword))
        
        if ($pwd1 -eq $pwd2 -and $pwd1.Length -ge 6) {
            $validPassword = $true
            $plainPassword = $pwd1
        } else {
            if ($pwd1 -ne $pwd2) {
                Write-Warning "Passwords do not match."
            } else {
                Write-Warning "Password must be at least 6 characters."
            }
            $validPassword = $false
        }
    } while (-not $validPassword)
    
    # Get admin status
    $adminResponse = Read-Host "Should this user be an admin? (Y/N)"
    $isAdmin = $adminResponse -eq 'Y'
    
    # Get language
    Write-Info "Available languages: en, fr, es, de, it, pt"
    $language = Read-Host "Enter language code (default: en)"
    if ($language -eq "") { $language = "en" }
    
    # Confirm details
    Write-Info "`nUser Details:"
    Write-Host "  Email: $email"
    Write-Host "  Name: $firstName $lastName"
    Write-Host "  Admin: $isAdmin"
    Write-Host "  Language: $language"
    
    $confirm = Read-Host "`nCreate this user? (Y/N)"
    
    if ($confirm -eq 'Y') {
        New-PHISUser -Email $email -FirstName $firstName -LastName $lastName `
                     -Password $plainPassword -IsAdmin $isAdmin -Language $language
    } else {
        Write-Warning "User creation cancelled."
    }
}
#endregion

#region Diagnostic Functions
function Test-PHISInstallation {
    Write-Step "Running Diagnostics"
    
    # Local checks
    Write-Info "Local Environment:"
    Write-Host "  PowerShell Version: $($PSVersionTable.PSVersion)"
    
    $azModule = Get-Module -ListAvailable -Name Az
    if ($azModule) {
        Write-Success "  Azure Module: Installed (v$($azModule.Version))"
    } else {
        Write-Error "  Azure Module: Not installed"
    }
    
    $sshKeys = Find-SSHKeys
    if ($sshKeys.Count -gt 0) {
        Write-Success "  SSH Keys: $($sshKeys.Count) found"
    } else {
        Write-Error "  SSH Keys: None found"
    }
    
    # Remote checks if VM info available
    $info = Get-ConnectionInfo
    if ($info -and $info.PublicIP) {
        Write-Info "`nVM Connectivity:"
        
        # Ping test
        $pingResult = Test-Connection -ComputerName $info.PublicIP -Count 2 -Quiet 2>$null
        if ($pingResult) {
            Write-Success "  Ping: VM is reachable"
        } else {
            Write-Warning "  Ping: No response (may be normal)"
        }
        
        # Port checks
        @(
            @{Port=22; Name="SSH"},
            @{Port=28081; Name="PHIS Web"},
            @{Port=8080; Name="HTTP Alt"},
            @{Port=80; Name="HTTP"}
        ) | ForEach-Object {
            if (Test-Port -ComputerName $info.PublicIP -Port $_.Port -Timeout 3) {
                Write-Success "  Port $($_.Port) ($($_.Name)): Open"
            } else {
                Write-Warning "  Port $($_.Port) ($($_.Name)): Closed"
            }
        }
        
        # Service check
        try {
            $webResponse = Invoke-WebRequest -Uri "http://$($info.PublicIP):28081/phis/app/" -TimeoutSec 5 -UseBasicParsing -ErrorAction SilentlyContinue
            if ($webResponse.StatusCode -eq 200) {
                Write-Success "  PHIS Web Interface: Accessible"
            }
        }
        catch {
            Write-Warning "  PHIS Web Interface: Not accessible"
        }
    }
}
#endregion

#region SSH Diagnostic Functions
function Test-SSHConnectivity {
    Write-Step "SSH Connectivity Diagnostic"
    
    $info = Get-ConnectionInfo
    if (-not $info) {
        Write-Error "No connection info found. Deploy a VM first or specify -VMIPAddress"
        return
    }
    
    $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
    if (-not $sshKey) { 
        Write-Error "No SSH private key found"
        return 
    }
    
    Write-Info "Connection Details:"
    Write-Host "  Target IP: $($info.PublicIP)"
    Write-Host "  Username: $($info.AdminUsername)"
    Write-Host "  SSH Key: $sshKey"
    
    # Test 1: DNS Resolution
    Write-Info "`nTest 1: DNS Resolution"
    try {
        $dns = [System.Net.Dns]::GetHostAddresses($info.PublicIP)
        Write-Success "IP address is valid: $($dns[0])"
    } catch {
        Write-Error "Failed to resolve IP address"
        return
    }
    
    # Test 2: Ping
    Write-Info "`nTest 2: ICMP Ping (may be blocked by Azure)"
    $ping = Test-Connection -ComputerName $info.PublicIP -Count 2 -Quiet 2>$null
    if ($ping) {
        Write-Success "Ping successful"
    } else {
        Write-Warning "Ping failed (this is often blocked in Azure and is normal)"
    }
    
    # Test 3: Port 22 connectivity
    Write-Info "`nTest 3: SSH Port (22) Connectivity"
    if (Test-Port -ComputerName $info.PublicIP -Port 22 -Timeout 5) {
        Write-Success "Port 22 is open"
        Write-Info "  Target: $($info.PublicIP):22"
    } else {
        Write-Error "Port 22 is not accessible"
        Write-Info "Check Network Security Group rules in Azure"
        return
    }
    
    # Test 4: SSH Key permissions
    Write-Info "`nTest 4: SSH Key File Permissions"
    if (Test-Path $sshKey) {
        Write-Success "SSH key file exists"
        $acl = Get-Acl $sshKey
        Write-Info "  Owner: $($acl.Owner)"
        Write-Info "  Permissions: $($acl.AccessToString)"
    } else {
        Write-Error "SSH key file not found: $sshKey"
        return
    }
    
    # Test 5: SSH connection with verbose output
    Write-Info "`nTest 5: SSH Connection Test (verbose)"
    Write-Info "Attempting SSH connection with verbose output..."
    
    $sshArgs = @(
        "-vvv"
        "-o", "StrictHostKeyChecking=no"
        "-o", "ConnectTimeout=10"
        "-i", $sshKey
        "$($info.AdminUsername)@$($info.PublicIP)"
        "echo 'SSH_TEST_SUCCESS'"
    )
    
    Write-Info "Command: ssh $($sshArgs -join ' ')"
    
    $process = Start-Process -FilePath "ssh" -ArgumentList $sshArgs -NoNewWindow -Wait -PassThru -RedirectStandardOutput "ssh-test-output.txt" -RedirectStandardError "ssh-test-error.txt"
    
    if ($process.ExitCode -eq 0) {
        Write-Success "SSH connection successful!"
        if (Test-Path "ssh-test-output.txt") {
            $output = Get-Content "ssh-test-output.txt"
            if ($output -match "SSH_TEST_SUCCESS") {
                Write-Success "Command execution successful"
            }
        }
    } else {
        Write-Error "SSH connection failed with exit code: $($process.ExitCode)"
        Write-Info "Error details:"
        if (Test-Path "ssh-test-error.txt") {
            $errors = Get-Content "ssh-test-error.txt" | Select-Object -Last 20
            $errors | ForEach-Object { Write-Host "  $_" -ForegroundColor Yellow }
        }
    }
    
    # Cleanup
    Remove-Item "ssh-test-output.txt", "ssh-test-error.txt" -ErrorAction SilentlyContinue
    
    Write-Info "`nTroubleshooting suggestions:"
    Write-Info "1. Verify the VM is running: .\PHIS.ps1 -Command Status"
    Write-Info "2. Check Azure Network Security Group for SSH rule"
    Write-Info "3. Ensure the correct SSH key is being used"
    Write-Info "4. Try manual connection: ssh -v -i `"$sshKey`" $($info.AdminUsername)@$($info.PublicIP)"
}
#endregion

#region Main Command Processing
function Process-Command {
    switch ($Command) {
        'Deploy' {
            $info = Deploy-PHISVM
            if ($info) {
                Write-Success "VM deployed successfully"
                Write-Host "`nPublic IP: $($info.PublicIP)"
                Write-Host "SSH: ssh -i $(Find-SSHPrivateKey) $($info.AdminUsername)@$($info.PublicIP)"
            }
        }
        
        'Install' {
            $info = Get-ConnectionInfo
            if (-not $info) {
                Write-Error "No VM connection info. Specify -VMIPAddress or deploy VM first."
                return
            }
            
            $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
            if (-not $sshKey) { return }
            
            Write-Info "Preparing to install PHIS..."
            Write-Info "VM IP: $($info.PublicIP)"
            Write-Info "Username: $($info.AdminUsername)"
            Write-Info "SSH Key: $sshKey"
            
            # First, check if we can connect at all
            Write-Info "`nChecking basic connectivity..."
            $portOpen = Test-Port -ComputerName $info.PublicIP -Port 22 -Timeout 5
            
            if (-not $portOpen) {
                Write-Error "Cannot reach SSH port 22 on $($info.PublicIP)"
                Write-Info "Please ensure:"
                Write-Info "1. The VM is running"
                Write-Info "2. Network Security Group allows SSH (port 22)"
                Write-Info "3. The IP address is correct"
                return
            }
            
            Write-Success "Port 22 is accessible"
            
            # Ask user if they want to skip SSH test since manual connection works
            if (-not $SkipSSHTest) {
                Write-Warning "`nThe automated SSH test sometimes fails even when manual connection works."
                Write-Info "If you can connect manually using option 5, you can skip the automated test."
                $skipTest = Read-Host "Skip SSH connection test and proceed with installation? (Y/N)"
            } else {
                Write-Info "Skipping SSH test as requested..."
                $skipTest = 'Y'
            }
            
            $connected = $false
            
            if ($skipTest -eq 'Y') {
                Write-Info "Skipping SSH test, proceeding with installation..."
                $connected = $true
            } else {
                # Try connection test with retries
                $maxRetries = 5
                $retryCount = 0
                
                Write-Info "Attempting SSH connection test..."
                
                while ($retryCount -lt $maxRetries -and -not $connected) {
                    $retryCount++
                    Write-Info "Attempt $retryCount of $maxRetries..."
                    
                    # Use simple mode for testing
                    if (Test-SSHConnection -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey -Simple) {
                        $connected = $true
                        break
                    }
                    
                    if ($retryCount -lt $maxRetries) {
                        Write-Warning "Connection test failed. Retrying in 10 seconds..."
                        Start-Sleep -Seconds 10
                    }
                }
                
                if (-not $connected) {
                    Write-Warning "Automated SSH test failed."
                    Write-Info "However, if you can connect manually (option 5), the installation can still proceed."
                    $proceed = Read-Host "Proceed with installation anyway? (Y/N)"
                    
                    if ($proceed -eq 'Y') {
                        Write-Info "Proceeding with installation despite test failure..."
                        $connected = $true
                    } else {
                        Write-Error "Installation cancelled."
                        Write-Info "Try connecting manually first: .\PHIS.ps1 -Command Connect"
                        return
                    }
                }
            }
            
            if (-not $SkipDependencies) {
                Install-Dependencies -ConnectionInfo $info -KeyPath $sshKey
                
                if ($SkipReboot) {
                    Write-Warning "Skipping reboot as requested. Docker may not work properly until VM is rebooted."
                    Write-Info "To reboot manually later, run: .\PHIS.ps1 -Command Restart"
                } else {
                    Write-Warning "The VM needs to reboot to apply Docker group changes."
                    $rebootChoice = Read-Host "Reboot VM now? (Y/N/S to skip reboot)"
                    
                    if ($rebootChoice -eq 'S') {
                        Write-Warning "Skipping reboot. You may need to reboot manually later for Docker to work properly."
                    } elseif ($rebootChoice -eq 'Y') {
                        Write-Info "Rebooting VM..."
                        try {
                            Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey -Command "sudo reboot" -ShowOutput:$false
                        } catch {
                            # Expected - connection will be lost
                        }
                        
                        Write-Info "VM is rebooting. Waiting 30 seconds before checking..."
                        Start-Sleep -Seconds 30
                        
                        Write-Info "Checking if VM is coming back online..."
                        $maxWaitTime = 180  # 3 minutes total
                        $checkInterval = 5
                        $elapsed = 0
                        $reconnected = $false
                        
                        while ($elapsed -lt $maxWaitTime) {
                            # Use our custom Test-Port function instead of Test-NetConnection
                            Write-Host "." -NoNewline
                            
                            if (Test-Port -ComputerName $info.PublicIP -Port 22 -Timeout 2) {
                                Write-Host ""
                                Write-Success "SSH port is accessible again!"
                                $reconnected = $true
                                
                                # Give SSH service a moment to fully initialize
                                Write-Info "Waiting 10 seconds for SSH service to fully start..."
                                Start-Sleep -Seconds 10
                                break
                            }
                            
                            Start-Sleep -Seconds $checkInterval
                            $elapsed += $checkInterval
                            
                            if ($elapsed % 30 -eq 0) {
                                Write-Host ""
                                Write-Info "Still waiting... ($elapsed seconds elapsed)"
                            }
                        }
                        
                        Write-Host ""
                        
                        if (-not $reconnected) {
                            Write-Warning "VM did not come back online within $maxWaitTime seconds."
                            Write-Info "The VM may still be restarting. You have several options:"
                            Write-Info "1. Wait a bit longer and run: .\PHIS.ps1 -Command Install -VMIPAddress $($info.PublicIP) -SkipDependencies"
                            Write-Info "2. Check VM status in Azure portal"
                            Write-Info "3. Try connecting manually: .\PHIS.ps1 -Command Connect"
                            
                            $continueAnyway = Read-Host "`nContinue with installation anyway? (Y/N)"
                            if ($continueAnyway -ne 'Y') {
                                return
                            }
                        }
                    } else {
                        Write-Info "Reboot cancelled. Continuing with installation..."
                        Write-Warning "Note: Docker commands may fail until the VM is rebooted."
                    }
                }
            }
            
            Install-PHIS -ConnectionInfo $info -KeyPath $sshKey
            Get-InstallationStatus -ConnectionInfo $info -KeyPath $sshKey
        }
        
        'FullInstall' {
            $info = Deploy-PHISVM
            if ($info) {
                Write-Info "VM deployed. Waiting for it to fully initialize..."
                Write-Info "This typically takes 60-90 seconds..."
                
                # Wait with progress indication
                $totalWait = 90
                for ($i = 0; $i -lt $totalWait; $i += 10) {
                    Write-Host "." -NoNewline
                    Start-Sleep -Seconds 10
                }
                Write-Host ""
                
                # Test if VM is accessible
                Write-Info "Checking VM accessibility..."
                $portOpen = Test-Port -ComputerName $info.PublicIP -Port 22 -Timeout 5
                
                if ($portOpen) {
                    Write-Success "VM is responding on port 22"
                    
                    # Note about SSH test issues
                    Write-Warning "`nNote: The automated SSH test sometimes fails even when the VM is ready."
                    Write-Info "If the installation fails at SSH connection, you can:"
                    Write-Info "1. Verify you can connect manually: .\PHIS.ps1 -Command Connect"
                    Write-Info "2. Run installation separately: .\PHIS.ps1 -Command Install -VMIPAddress $($info.PublicIP)"
                    Write-Info "3. Use -SkipSSHTest flag to bypass the test"
                    
                    Start-Sleep -Seconds 3
                    
                    Write-Info "`nProceeding with installation..."
                    $VMIPAddress = $info.PublicIP
                    
                    # Pass through the SkipSSHTest flag if set
                    if ($SkipSSHTest) {
                        & "$PSCommandPath" -Command Install -VMIPAddress $VMIPAddress -SkipSSHTest
                    } else {
                        & "$PSCommandPath" -Command Install -VMIPAddress $VMIPAddress
                    }
                } else {
                    Write-Error "VM is not accessible on port 22 after deployment"
                    Write-Info "This can happen if the VM is still initializing."
                    Write-Info "`nYou can:"
                    Write-Info "1. Wait a few minutes and check status: .\PHIS.ps1 -Command Status"
                    Write-Info "2. Try manual connection: .\PHIS.ps1 -Command Connect"
                    Write-Info "3. Run installation when ready: .\PHIS.ps1 -Command Install -VMIPAddress $($info.PublicIP)"
                }
            }
        }
        
        'Connect' { Connect-VM }
        'Status' { 
            $info = Get-ConnectionInfo
            if ($info) {
                $sshKey = Find-SSHPrivateKey -ProvidedPath $SSHKeyPath
                if ($sshKey) {
                    Get-InstallationStatus -ConnectionInfo $info -KeyPath $sshKey
                }
            }
            else {
                Get-VMStatus
            }
        }
        'Start' { Start-PHISVM }
        'Stop' { Stop-PHISVM }
        'Restart' { Restart-PHISVM }
        'Delete' { Remove-PHISResources }
        'Diagnose' { Test-PHISInstallation }
        'GenerateSSHKey' { New-SSHKeyPair }
        'TestSSHKeys' { Test-SSHKeyConfiguration }
        'ShowInfo' { 
            $info = Get-ConnectionInfo
            if ($info) {
                Write-Info "Connection Information:"
                $info | Format-List
            }
            Get-VMStatus
        }
        'GetIP' { 
            $info = Get-ConnectionInfo
            if ($info) {
                Write-Success "Public IP: $($info.PublicIP)"
            }
        }
        'OpenPorts' { Show-OpenPorts }
        'Logs' { Show-ServiceLogs }
        'TestSSH' { Test-SSHConnectivity }
        
        'CreateUser' {
            if ($UserEmail -and $UserFirstName -and $UserLastName -and $UserPassword) {
                # Command line mode
                New-PHISUser -Email $UserEmail -FirstName $UserFirstName -LastName $UserLastName `
                           -Password $UserPassword -IsAdmin:$UserIsAdmin -Language $UserLanguage
            } else {
                # Interactive mode
                Start-UserCreationWizard
            }
        }
        
        'ListUsers' {
            Get-PHISUsers
        }
        
        'Menu' {
            $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
            
            while ($true) {
                Show-Menu
                $choice = Read-Host "`nSelect option (0-15)"
                
                switch ($choice) {
                    "1" { & "$PSCommandPath" -Command FullInstall }
                    "2" { 
                        $ip = Read-Host "Enter VM IP address"
                        & "$PSCommandPath" -Command Install -VMIPAddress $ip
                    }
                    "3" { & "$PSCommandPath" -Command Deploy }
                    "4" { & "$PSCommandPath" -Command Status }
                    "5" { & "$PSCommandPath" -Command Connect }
                    "6" { 
                        Write-Host "`n1. Start VM"
                        Write-Host "2. Stop VM"
                        Write-Host "3. Restart VM"
                        $powerChoice = Read-Host "`nSelect option"
                        switch ($powerChoice) {
                            "1" { & "$PSCommandPath" -Command Start }
                            "2" { & "$PSCommandPath" -Command Stop }
                            "3" { & "$PSCommandPath" -Command Restart }
                        }
                    }
                    "7" { & "$PSCommandPath" -Command Logs }
                    "8" { & "$PSCommandPath" -Command Delete }
                    "9" { & "$PSCommandPath" -Command CreateUser }
                    "10" { & "$PSCommandPath" -Command ListUsers }
                    "11" { & "$PSCommandPath" -Command Diagnose }
                    "12" { & "$PSCommandPath" -Command GenerateSSHKey }
                    "13" { & "$PSCommandPath" -Command TestSSHKeys }
                    "14" { 
                        if ($isAdmin) {
                            Install-Module -Name Az -Repository PSGallery -Force -AllowClobber
                            Write-Success "Azure module installed"
                        } else {
                            Write-Warning "Run as Administrator or use:"
                            Write-Info "Install-Module -Name Az -Scope CurrentUser"
                        }
                    }
                    "15" { & "$PSCommandPath" -Command ShowInfo }
                    "0" { 
                        Write-Host "`nThank you for using PHIS Master Controller!" -ForegroundColor Green
                        return 
                    }
                    default { Write-Warning "Invalid option" }
                }
                
                Write-Host "`nPress any key to continue..." -ForegroundColor Yellow
                $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            }
        }
    }
}
#endregion

# Main execution
try {
    if ($Command -eq 'Menu') {
        Show-Banner
    }
    Process-Command
}
catch {
    Write-Error "Script execution failed: $_"
    exit 1
}