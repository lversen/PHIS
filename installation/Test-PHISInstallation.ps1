#Requires -Version 5.1
<#
.SYNOPSIS
    Diagnostic tool for PHIS installation troubleshooting.

.DESCRIPTION
    This script performs various checks to diagnose common issues with PHIS installation.

.PARAMETER VMIPAddress
    IP address of the VM to check

.PARAMETER LocalChecksOnly
    Only perform local checks (skip VM connectivity tests)

.EXAMPLE
    .\Test-PHISInstallation.ps1
    
.EXAMPLE
    .\Test-PHISInstallation.ps1 -VMIPAddress "20.50.100.200"
#>

[CmdletBinding()]
param(
    [string]$VMIPAddress,
    [switch]$LocalChecksOnly
)

$ErrorActionPreference = "Continue"

# Color functions
function Write-TestResult {
    param(
        [string]$Test,
        [bool]$Pass,
        [string]$Details = ""
    )
    
    $status = if ($Pass) { "PASS" } else { "FAIL" }
    $color = if ($Pass) { "Green" } else { "Red" }
    
    Write-Host "  [$status] " -ForegroundColor $color -NoNewline
    Write-Host $Test
    if ($Details) {
        Write-Host "       $Details" -ForegroundColor Gray
    }
}

function Write-Section {
    param([string]$Title)
    Write-Host "`n━━━ $Title ━━━" -ForegroundColor Cyan
}

# Banner
Write-Host @"

╔═══════════════════════════════════════════════════════════════╗
║               PHIS Installation Diagnostic Tool                ║
╚═══════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

# Local checks
Write-Section "Local Environment Checks"

# Check PowerShell version
$psVersion = $PSVersionTable.PSVersion
Write-TestResult "PowerShell Version" `
    ($psVersion.Major -ge 5) `
    "Version: $($psVersion.ToString())"

# Check Azure module
$azModule = Get-Module -ListAvailable -Name Az
Write-TestResult "Azure PowerShell Module" `
    ($null -ne $azModule) `
    $(if ($azModule) { "Version: $($azModule.Version)" } else { "Run: Install-Module -Name Az" })

# Check required files
$requiredFiles = @(
    "Install-PHIS.ps1",
    "Deploy-AzurePHISVM.ps1",
    "template-vm.json",
    "Manage-AzurePHISVM.ps1"
)

$missingFiles = @()
foreach ($file in $requiredFiles) {
    $exists = Test-Path $file
    if (-not $exists) { $missingFiles += $file }
}

Write-TestResult "Required Files" `
    ($missingFiles.Count -eq 0) `
    $(if ($missingFiles.Count -gt 0) { "Missing: $($missingFiles -join ', ')" } else { "All files present" })

# Check SSH keys
Write-Section "SSH Key Checks"

$sshDir = @("$env:USERPROFILE\.ssh", "$HOME/.ssh") | Where-Object { Test-Path $_ } | Select-Object -First 1
$sshKeysFound = $false
$keyTypes = @("id_ed25519", "id_rsa", "id_ecdsa")

if ($sshDir) {
    foreach ($keyType in $keyTypes) {
        $privKey = Join-Path $sshDir $keyType
        $pubKey = Join-Path $sshDir "$keyType.pub"
        
        if (Test-Path $privKey) {
            $hasPub = Test-Path $pubKey
            Write-TestResult "$keyType Key Pair" `
                $hasPub `
                $(if ($hasPub) { "Both private and public keys found" } else { "Missing public key!" })
            $sshKeysFound = $true
        }
    }
}

if (-not $sshKeysFound) {
    Write-TestResult "SSH Keys" $false "No SSH keys found. Run: ssh-keygen -t ed25519 -a 100"
}

# Check saved connection info
$connInfoFile = ".\phis-vm-connection-info.json"
$hasConnInfo = Test-Path $connInfoFile
Write-TestResult "Saved Connection Info" `
    $hasConnInfo `
    $(if ($hasConnInfo) { 
        $info = Get-Content $connInfoFile | ConvertFrom-Json
        "VM: $($info.VMName), IP: $($info.PublicIP)" 
    } else { 
        "No saved VM info found" 
    })

# Get VM IP for remote checks
if (-not $VMIPAddress -and $hasConnInfo) {
    $info = Get-Content $connInfoFile | ConvertFrom-Json
    $VMIPAddress = $info.PublicIP
    Write-Host "`nUsing saved VM IP: $VMIPAddress" -ForegroundColor Yellow
}

# Remote checks
if (-not $LocalChecksOnly -and $VMIPAddress) {
    Write-Section "VM Connectivity Checks"
    
    # Ping test
    $pingResult = Test-Connection -ComputerName $VMIPAddress -Count 2 -Quiet 2>$null
    Write-TestResult "Ping Test" `
        $pingResult `
        $(if ($pingResult) { "VM is reachable" } else { "VM not responding to ping (may be normal)" })
    
    # Port checks
    $portsToCheck = @(
        @{Port=22; Name="SSH"},
        @{Port=28081; Name="PHIS Web"},
        @{Port=8080; Name="HTTP Alt"},
        @{Port=80; Name="HTTP"}
    )
    
    foreach ($portInfo in $portsToCheck) {
        $tcpTest = Test-NetConnection -ComputerName $VMIPAddress -Port $portInfo.Port -WarningAction SilentlyContinue
        Write-TestResult "Port $($portInfo.Port) ($($portInfo.Name))" `
            ($tcpTest.TcpTestSucceeded) `
            $(if ($tcpTest.TcpTestSucceeded) { "Port is open" } else { "Port is closed or filtered" })
    }
    
    # Web interface check
    Write-Section "Service Availability Checks"
    
    try {
        $webResponse = Invoke-WebRequest -Uri "http://${VMIPAddress}:28081/phis/app/" -TimeoutSec 5 -UseBasicParsing -ErrorAction SilentlyContinue
        Write-TestResult "PHIS Web Interface" `
            ($webResponse.StatusCode -eq 200) `
            "HTTP Status: $($webResponse.StatusCode)"
    }
    catch {
        Write-TestResult "PHIS Web Interface" $false "Not accessible - service may not be running"
    }
    
    try {
        $apiResponse = Invoke-WebRequest -Uri "http://${VMIPAddress}:28081/phis/swagger-ui.html" -TimeoutSec 5 -UseBasicParsing -ErrorAction SilentlyContinue
        Write-TestResult "PHIS API Documentation" `
            ($apiResponse.StatusCode -eq 200) `
            "HTTP Status: $($apiResponse.StatusCode)"
    }
    catch {
        Write-TestResult "PHIS API Documentation" $false "Not accessible"
    }
}
elseif (-not $LocalChecksOnly) {
    Write-Host "`n⚠️  No VM IP address provided. Skipping remote checks." -ForegroundColor Yellow
    Write-Host "   Run with -VMIPAddress parameter to test VM connectivity." -ForegroundColor Yellow
}

# Azure connection check
if (-not $LocalChecksOnly) {
    Write-Section "Azure Connection Check"
    
    try {
        $context = Get-AzContext -ErrorAction SilentlyContinue
        Write-TestResult "Azure Login" `
            ($null -ne $context) `
            $(if ($context) { "Logged in as: $($context.Account)" } else { "Not logged in. Run: Connect-AzAccount" })
    }
    catch {
        Write-TestResult "Azure Login" $false "Error checking Azure context"
    }
}

# Summary and recommendations
Write-Section "Summary & Recommendations"

Write-Host "`nBased on the diagnostics:" -ForegroundColor White

$issues = @()

if (-not $azModule) {
    $issues += "- Install Azure PowerShell: Install-Module -Name Az -Force"
}

if (-not $sshKeysFound) {
    $issues += "- Generate SSH key: ssh-keygen -t ed25519 -a 100"
}

if ($missingFiles.Count -gt 0) {
    $issues += "- Missing required files. Ensure all scripts are in the same directory."
}

if ($VMIPAddress -and -not $pingResult) {
    $issues += "- VM may be stopped. Check: .\Manage-AzurePHISVM.ps1 -Action Status"
}

if ($issues.Count -eq 0) {
    Write-Host "✅ All checks passed! Environment is ready for PHIS installation." -ForegroundColor Green
    
    if ($VMIPAddress) {
        Write-Host "`nNext steps:" -ForegroundColor Yellow
        Write-Host "1. If PHIS not installed: .\Install-PHIS.ps1 -UseExistingVM -VMIPAddress '$VMIPAddress'"
        Write-Host "2. If installed, access at: http://${VMIPAddress}:28081/phis/app/"
    }
    else {
        Write-Host "`nNext steps:" -ForegroundColor Yellow
        Write-Host "1. Run full installation: .\Install-PHIS.ps1"
        Write-Host "2. Or specify existing VM: .\Install-PHIS.ps1 -UseExistingVM -VMIPAddress 'YOUR_IP'"
    }
}
else {
    Write-Host "❌ Issues found:" -ForegroundColor Red
    foreach ($issue in $issues) {
        Write-Host $issue -ForegroundColor Yellow
    }
}

Write-Host "`n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan