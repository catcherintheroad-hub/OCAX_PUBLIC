# OCAX Git Publish Command v1

**Version**: 1.0  
**Purpose**: Git Push Commands Guide  
**Last Updated**: 2026-03-17

---

## Run Git Push Script

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_git_push.ps1
```

---

## What the Script Does

1. **Check git availability** - Verifies git is installed
2. **Verify repository** - Confirms we're in a git repo
3. **Check status** - Shows changed files
4. **Git add** - Stages all changes
5. **Git commit** - Commits with timestamp message
6. **Git push** - Pushes to remote

---

## Success Output Example

```
========================================
OCAX Git Push Script
========================================

[OK] Git available: git version 2.x.x
[OK] Git repository confirmed

Current branch: main

[1/3] Checking git status...
[INFO] Found 5 changed file(s)

Changed files:
  M  README.md
  A  docs/OCAX_FINAL_PUBLISH_PACK_V1.md
  ...

[2/3] Running git add...
[OK] git add completed

[3/3] Running git commit...
[OK] git commit completed
Commit message: update publish pack - 2026-03-17 19:05

Pushing to remote...
[OK] git push completed

========================================
Git Push Complete!
========================================

Branch: main
Commit: update publish pack - 2026-03-17 19:05
Status: Successfully pushed
```

---

## Error Cases

### No changes to commit

```
[INFO] No changes to commit

========================================
No changes to push
========================================
```

### Git not installed

```
[ERROR] Git is not installed or not in PATH
```

### Push failed

```
[ERROR] git push failed: ...
```

---

## Recommended Workflow

1. Run check
```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_check.ps1
```

2. Generate pack
```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_publish_pack.ps1
```

3. Push to git
```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_git_push.ps1
```

---

*OCAX Git Publish Command v1.0*
