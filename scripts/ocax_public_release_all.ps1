# OCAX Public Release All Script

$ErrorActionPreference = "Stop"

# Force working directory to OCAX_PUBLIC repo
$repoPath = "D:\OCAX_PUBLIC"
if (-not (Test-Path $repoPath)) {
    Write-Host "[ERROR] OCAX_PUBLIC repository not found at: $repoPath" -ForegroundColor Red
    exit 1
}

Set-Location $repoPath

Write-Host "========================================"
Write-Host "OCAX PUBLIC Release All Script"
Write-Host "========================================"
Write-Host ""

# Verify we're in OCAX_PUBLIC
Write-Host "[CHECK] Verifying OCAX_PUBLIC repository..."

$currentDir = Get-Location
if ($currentDir.Path -ne $repoPath) {
    Write-Host "[ERROR] Wrong directory. Expected: $repoPath" -ForegroundColor Red
    Write-Host "[ERROR] Current: $($currentDir.Path)" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Correct directory: $repoPath" -ForegroundColor Green
Write-Host ""

# Check remote
Write-Host "[CHECK] Verifying remote configuration..."
$remoteOutput = git remote -v
$expectedRemote = "OCAX_PUBLIC"
$hasCorrectRemote = $remoteOutput -match $expectedRemote
if (-not $hasCorrectRemote) {
    Write-Host "[ERROR] Remote is not OCAX_PUBLIC" -ForegroundColor Red
    Write-Host "[ERROR] Current remote: $remoteOutput" -ForegroundColor Red
    Write-Host "[ERROR] Expected to contain: $expectedRemote" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Remote is correct: OCAX_PUBLIC" -ForegroundColor Green
Write-Host ""

# Run git push script
Write-Host "========================================"
Write-Host "[STEP] Running git push script..."
Write-Host "========================================"
Write-Host ""

& "$repoPath\scripts\ocax_public_git_push.ps1"

Write-Host ""
Write-Host "========================================"
Write-Host "OCAX PUBLIC Release Complete!"
Write-Host "========================================"
Write-Host ""
Write-Host "Repository: https://github.com/catcherintheroad-hub/OCAX_PUBLIC"
Write-Host ""
