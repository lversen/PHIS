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
    .\PHIS.ps1 -Command Connect
    # SSH to VM
#>

[CmdletBinding()]
param(
    [ValidateSet('Menu', 'Deploy', 'Install', 'FullInstall', 'Connect', 'Status', 
                 'Start', 'Stop', 'Restart', 'Delete', 'Diagnose', 'GenerateSSHKey', 
                 'TestSSHKeys', 'ShowInfo', 'GetIP', 'OpenPorts', 'Logs')]
    [string]$Command = 'Menu',
    
    [string]$VMName = "phis",
    [string]$ResourceGroupName = "RG-PHIS",
    [string]$VMIPAddress,
    [string]$Location = "westeurope",
    [string]$AdminUsername = "azureuser",
    [string]$SSHKeyPath,
    [string]$TemplateFile = "template-vm.json",
    [switch]$SkipDependencies,
    [switch]$SkipPrerequisiteCheck,
    [switch]$DebugSSHKeys,
    [switch]$NoPassphrase,
    [string]$KeyType = "ed25519",
    [string]$KeyName
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
    
    Write-Host "`n━━━ Utilities ━━━" -ForegroundColor Yellow
    Write-Host "  9. " -NoNewline; Write-Host "Run Diagnostics" -ForegroundColor White
    Write-Host " 10. " -NoNewline; Write-Host "Generate SSH Key" -ForegroundColor White
    Write-Host " 11. " -NoNewline; Write-Host "Test SSH Keys" -ForegroundColor White
    Write-Host " 12. " -NoNewline; Write-Host "Install Azure PowerShell Module" -ForegroundColor White
    Write-Host " 13. " -NoNewline; Write-Host "Show VM Information" -ForegroundColor White
    
    Write-Host "`n  0. " -NoNewline; Write-Host "Exit" -ForegroundColor Red
    Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
}
#endregion

#region SSH Key Functions
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
        [string]$KeyPath
    )
    
    Write-Info "Testing SSH connection to $IPAddress..."
    
    $sshArgs = @(
        "-o", "StrictHostKeyChecking=no"
        "-o", "ConnectTimeout=10"
        "-i", $KeyPath
        "$Username@$IPAddress"
        "echo CONNECTION_SUCCESS"
    )
    
    try {
        $result = & ssh $sshArgs 2>&1
        if ($result -match "CONNECTION_SUCCESS") {
            Write-Success "SSH connection successful"
            return $true
        }
    }
    catch {}
    
    Write-Warning "SSH connection failed"
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
    # Pipe 'N' to the script to automatically decline the optional VS Code installation, preventing the script from hanging on interactive input.
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
            $tcpTest = Test-NetConnection -ComputerName $info.PublicIP -Port $_.Port -WarningAction SilentlyContinue
            if ($tcpTest.TcpTestSucceeded) {
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
            
            $retries = 5
            while ($retries -gt 0) {
                if (Test-SSHConnection -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey) {
                    break
                }
                $retries--
                if ($retries -gt 0) {
                    Write-Warning "SSH connection failed. Retrying in 10 seconds..."
                    Start-Sleep -Seconds 10
                }
            }
            
            if ($retries -eq 0) {
                Write-Error "Could not establish SSH connection"
                return
            }
            
            if (-not $SkipDependencies) {
                Install-Dependencies -ConnectionInfo $info -KeyPath $sshKey
                
                Write-Warning "Rebooting the VM to apply dependency changes (e.g., Docker group membership)."
                try {
                    Invoke-SSHCommand -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey -Command "sudo reboot" -ShowOutput:$false
                } catch {
                    # This is expected as the connection will be terminated.
                    Write-Info "Reboot command issued. The SSH connection will be lost as expected."
                }

                Write-Info "Waiting for VM to restart (approximately 60 seconds)..."
                Start-Sleep -Seconds 60

                # Re-establish connection after reboot
                Write-Info "Attempting to reconnect to the VM..."
                $retries = 12 # Give it more time to come back up
                $connected = $false
                while ($retries -gt 0) {
                    if (Test-SSHConnection -IPAddress $info.PublicIP -Username $info.AdminUsername -KeyPath $sshKey) {
                        Write-Success "Successfully reconnected to the VM."
                        $connected = $true
                        break
                    }
                    $retries--
                    if ($retries -gt 0) {
                        Write-Info "VM not ready yet. Retrying in 10 seconds..."
                        Start-Sleep -Seconds 10
                    }
                }

                if (-not $connected) {
                    Write-Error "Could not reconnect to the VM after reboot. Please check the VM status in Azure portal."
                    return
                }
            }
            
            Install-PHIS -ConnectionInfo $info -KeyPath $sshKey
            Get-InstallationStatus -ConnectionInfo $info -KeyPath $sshKey
        }
        
        'FullInstall' {
            $info = Deploy-PHISVM
            if ($info) {
                Write-Info "Waiting for VM to be ready..."
                Start-Sleep -Seconds 30
                
                $VMIPAddress = $info.PublicIP
                & "$PSCommandPath" -Command Install -VMIPAddress $VMIPAddress
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
        
        'Menu' {
            $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
            
            while ($true) {
                Show-Menu
                $choice = Read-Host "`nSelect option (0-13)"
                
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
                    "9" { & "$PSCommandPath" -Command Diagnose }
                    "10" { & "$PSCommandPath" -Command GenerateSSHKey }
                    "11" { & "$PSCommandPath" -Command TestSSHKeys }
                    "12" { 
                        if ($isAdmin) {
                            Install-Module -Name Az -Repository PSGallery -Force -AllowClobber
                            Write-Success "Azure module installed"
                        } else {
                            Write-Warning "Run as Administrator or use:"
                            Write-Info "Install-Module -Name Az -Scope CurrentUser"
                        }
                    }
                    "13" { & "$PSCommandPath" -Command ShowInfo }
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