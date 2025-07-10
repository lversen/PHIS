#Requires -Version 5.1
<#
.SYNOPSIS
    Generates a new SSH key pair for Azure VM authentication.

.DESCRIPTION
    Creates a new SSH key pair (ED25519 recommended) in the user's .ssh directory.

.PARAMETER KeyType
    Type of SSH key to generate (ed25519, rsa, ecdsa)

.PARAMETER KeyName
    Name for the key file (without extension)

.PARAMETER Passphrase
    Add a passphrase to the key (interactive prompt if not specified)

.EXAMPLE
    .\New-SSHKey.ps1
    
.EXAMPLE
    .\New-SSHKey.ps1 -KeyType rsa -KeyName azure_vm_key
#>

[CmdletBinding()]
param(
    [ValidateSet("ed25519", "rsa", "ecdsa")]
    [string]$KeyType = "ed25519",
    
    [string]$KeyName = "id_$KeyType",
    
    [switch]$NoPassphrase
)

# Color output functions
function Write-Success { Write-Host $args[0] -ForegroundColor Green }
function Write-Info { Write-Host $args[0] -ForegroundColor Cyan }
function Write-Warning { Write-Host $args[0] -ForegroundColor Yellow }
function Write-Error { Write-Host $args[0] -ForegroundColor Red }

Write-Host "`n====================================" -ForegroundColor Cyan
Write-Host "    SSH Key Generator for Azure" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan

# Check if ssh-keygen exists
$sshKeygen = Get-Command ssh-keygen -ErrorAction SilentlyContinue
if (-not $sshKeygen) {
    Write-Error "ssh-keygen not found!"
    Write-Info "Windows 10/11 includes OpenSSH by default."
    Write-Info "To install OpenSSH client:"
    Write-Info "1. Open Settings > Apps > Optional Features"
    Write-Info "2. Add 'OpenSSH Client'"
    exit 1
}

# Create .ssh directory if it doesn't exist
$sshDir = "$env:USERPROFILE\.ssh"
if (-not (Test-Path $sshDir)) {
    Write-Info "Creating .ssh directory..."
    New-Item -ItemType Directory -Path $sshDir -Force | Out-Null
}

# Check if key already exists
$keyPath = Join-Path $sshDir $KeyName
if (Test-Path $keyPath) {
    Write-Warning "Key already exists: $keyPath"
    $overwrite = Read-Host "Overwrite existing key? (Y/N)"
    if ($overwrite -ne 'Y') {
        Write-Info "Key generation cancelled"
        exit 0
    }
}

# Set key parameters based on type
$keyParams = switch ($KeyType) {
    "ed25519" { @("-t", "ed25519", "-a", "100") }
    "rsa"     { @("-t", "rsa", "-b", "4096") }
    "ecdsa"   { @("-t", "ecdsa", "-b", "521") }
}

# Add common parameters
$keyParams += @("-f", $keyPath, "-C", "$env:USERNAME@$env:COMPUTERNAME")

# Add passphrase parameter if specified
if ($NoPassphrase) {
    $keyParams += @("-N", '""')
}

Write-Info "`nGenerating $KeyType SSH key..."
Write-Info "Key location: $keyPath"

# Generate the key
try {
    $process = Start-Process -FilePath "ssh-keygen" -ArgumentList $keyParams -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Success "`nSSH key generated successfully!"
        
        # Display the public key
        $pubKeyPath = "$keyPath.pub"
        if (Test-Path $pubKeyPath) {
            $pubKey = Get-Content $pubKeyPath
            
            Write-Info "`nYour public key (for Azure VM):"
            Write-Host $pubKey -ForegroundColor Yellow
            
            # Copy to clipboard if possible
            try {
                $pubKey | Set-Clipboard
                Write-Success "`nPublic key copied to clipboard!"
            } catch {
                Write-Info "`nCopy the above public key for your Azure VM deployment"
            }
            
            Write-Info "`nKey files created:"
            Write-Host "  Private key: $keyPath" -ForegroundColor Gray
            Write-Host "  Public key:  $pubKeyPath" -ForegroundColor Gray
            
            Write-Info "`nNext steps:"
            Write-Host "1. Use this public key in your Azure VM deployment"
            Write-Host "2. Keep your private key ($KeyName) secure"
            Write-Host "3. Run .\Deploy-AzurePHISVM.ps1 to deploy your VM"
        }
    } else {
        Write-Error "Key generation failed with exit code: $($process.ExitCode)"
    }
} catch {
    Write-Error "Error generating SSH key: $_"
}