# OCAX Public Git Push Script

$ErrorActionPreference = "Continue"

# Force working directory to OCAX_PUBLIC repo
$repoPath = "D:\OCAX_PUBLIC"
if (-not (Test-Path $repoPath)) {
    Write-Host "[ERROR] OCAX_PUBLIC repository not found at: $repoPath" -ForegroundColor Red
    exit 1
}

Set-Location $repoPath

Write-Host "========================================"
Write-Host "OCAX PUBLIC Git Push Script"
Write-Host "========================================"
Write-Host ""

# Check current directory
$currentDir = Get-Location
Write-Host "[INFO] Current working directory: $currentDir"

# Check if git is available
$gitVersion = git --version 2>$null
if (-not $gitVersion) {
    Write-Host "[ERROR] Git is not installed or not in PATH" -ForegroundColor Red
    exit 1
}

Write-Host "[OK] Git available: $gitVersion"
Write-Host ""

# Check if we're in a git repository
$isRepo = git rev-parse --git-dir 2>$null
if (-not $isRepo) {
    Write-Host "[ERROR] Not a git repository: $currentDir" -ForegroundColor Red
    exit 1
}

Write-Host "[OK] Git repository confirmed"
Write-Host ""

# Show git remote
Write-Host "[INFO] Git remote configuration:"
$remoteOutput = git remote -v
if ($remoteOutput.Count -eq 0) {
    Write-Host "[ERROR] No remote configured. Cannot push." -ForegroundColor Red
    exit 1
}
$remoteOutput | ForEach-Object { Write-Host "  $_" }
Write-Host ""

# Verify remote is OCAX_PUBLIC
$expectedRemote = "https://github.com/catcherintheroad-hub/OCAX_PUBLIC.git"
$hasCorrectRemote = $remoteOutput -match "OCAX_PUBLIC"
if (-not $hasCorrectRemote) {
    Write-Host "[ERROR] Remote is not OCAX_PUBLIC repository" -ForegroundColor Red
    Write-Host "[ERROR] Expected: $expectedRemote" -ForegroundColor Red
    exit 1
}
Write-Host "[OK] Remote is correct: OCAX_PUBLIC" -ForegroundColor Green
Write-Host ""

# Get current branch
$currentBranch = git branch --show-current
Write-Host "[INFO] Current branch: $currentBranch"
Write-Host ""

# Check git status
Write-Host "[1/3] Checking git status..."
$status = git status --porcelain
if ($status.Count -eq 0) {
    Write-Host "[INFO] No changes to commit" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "========================================"
    Write-Host "No changes to push"
    Write-Host "========================================"
    exit 0
}

Write-Host "[INFO] Found $($status.Count) changed file(s)"
Write-Host ""
Write-Host "Changed files:"
$status | ForEach-Object { Write-Host "  $_" }
Write-Host ""

# Git add
Write-Host "[2/3] Running git add..."
git add . 2>&1 | Out-Null
Write-Host "[OK] git add completed" -ForegroundColor Green
Write-Host ""

# Git commit
Write-Host "[3/3] Running git commit..."
$commitMessage = "update public docs - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git commit -m "$commitMessage" 2>&1 | Out-Null
Write-Host "[OK] git commit completed" -ForegroundColor Green
Write-Host "Commit message: $commitMessage"
Write-Host ""

# Git push
$pushCommand = "git push -u origin $currentBranch"
Write-Host "========================================"
Write-Host "[PUSH] Executing command:"
Write-Host "  $pushCommand"
Write-Host "========================================"
Write-Host ""

$pushOutput = & git push -u origin $currentBranch 2>&1
$exitCode = $LASTEXITCODE

Write-Host "[PUSH OUTPUT]" -ForegroundColor Cyan
$pushOutput | ForEach-Object { Write-Host "  $_" }
Write-Host ""

if ($exitCode -eq 0) {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "PUSH SUCCESS" -ForegroundColor Green
    Write-Host "========================================"
    Write-Host "Remote: origin (OCAX_PUBLIC)"
    Write-Host "Branch: $currentBranch"
    Write-Host "Status: Successfully pushed" -ForegroundColor Green
    Write-Host ""
    exit 0
} else {
    Write-Host ""
    Write-Host "========================================"
    Write-Host "PUSH FAILED" -ForegroundColor Red
    Write-Host "========================================"
    Write-Host "Exit Code: $exitCode"
    Write-Host ""
    exit 1
}
