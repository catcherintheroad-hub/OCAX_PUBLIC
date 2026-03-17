# OCAX Repo Clean Command v1

**Version**: 1.0  
**Purpose**: Clean Git Tracking Guide  
**Last Updated**: 2026-03-17

---

## Run Clean Script

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_repo_clean.ps1
```

---

## What the Script Does

This script removes files from Git tracking **without deleting them from your local disk**.

It handles:
- `release/` - Release output directory
- `node_modules/` - Node.js dependencies
- `__pycache__/` - Python cache
- `.venv/` / `venv/` - Python virtual environments
- `dist/` / `build/` - Build outputs
- `*.log` - Log files
- `*.tmp` - Temporary files
- `.cache/` - Cache directories
- `logs/` - Log directories

---

## Important Notes

### What Happens

1. Script checks if each path is tracked by Git
2. If tracked, it removes from Git index only
3. Local files are **NOT deleted**

### After Running

You need to commit the changes:

```bash
git commit -m "Clean gitignore files"
git push
```

---

## Why This Matters

When you first add files to Git tracking, then later add them to `.gitignore`, they remain tracked. This script removes them from tracking while keeping your local files safe.

---

## Example Output

```
========================================
OCAX Repository Clean Script
========================================

[OK] Git available: git version 2.x.x

========================================
Files to be removed from Git tracking:
========================================

Checking: release/
  [SKIP] Not tracked: release/
Checking: node_modules/
  [FOUND] Removing from index: node_modules/
  [OK] Removed: node_modules/
...

========================================
Clean Summary
========================================

Removed from tracking: 5
Skipped (errors):     0
Not found/tracked:    11

NOTE: Files are NOT deleted from your local disk.
They are only removed from Git tracking.

To complete cleanup, run:
  git commit -m "Clean gitignore files"
  git push
```

---

## Warning

**Always review the output before committing!**

---

*OCAX Repo Clean Command v1.0*
