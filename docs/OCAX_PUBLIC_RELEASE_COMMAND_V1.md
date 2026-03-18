# OCAX Public Release Command v1

**Version**: 1.0  
**Purpose**: Commands for Public Repository Release  
**Last Updated**: 2026-03-18

---

## Quick Start

### Run Git Push Only

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX_PUBLIC\scripts\ocax_public_git_push.ps1
```

### Run Full Release (check + push)

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX_PUBLIC\scripts\ocax_public_release_all.ps1
```

---

## Scripts

### ocax_public_git_push.ps1

- Checks current directory is D:\OCAX_PUBLIC
- Verifies remote is https://github.com/catcherintheroad-hub/OCAX_PUBLIC.git
- Runs git add . → git commit → git push
- Exits if not OCAX_PUBLIC repository

### ocax_public_release_all.ps1

- Verifies we're in D:\OCAX_PUBLIC
- Verifies remote is OCAX_PUBLIC
- Runs git push script

---

## What These Scripts Do

| Script | Purpose |
|--------|----------|
| ocax_public_git_push.ps1 | Git add + commit + push |
| ocax_public_release_all.ps1 | Full release (check + push) |

---

## What These Scripts Prevent

- ❌ Accidentally pushing to D:\OCAX (private repo)
- ❌ Wrong remote configuration
- ❌ Wrong directory

---

## Repository

**Public Repository**: https://github.com/catcherintheroad-hub/OCAX_PUBLIC

---

## Usage

### From Telegram

Trigger the script via OpenClaw command:

```
/ocax_public_release
```

Or run directly:

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX_PUBLIC\scripts\ocax_public_release_all.ps1
```

---

*OCAX Public Release Command v1.0*
