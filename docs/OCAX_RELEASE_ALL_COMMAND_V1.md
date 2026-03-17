# OCAX Release All Command v1

**Version**: 1.0  
**Purpose**: One-command Release Guide  
**Last Updated**: 2026-03-17

---

## Run All-in-One Release Script

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_release_all.ps1
```

---

## What the Script Does

The script runs 3 steps in sequence:

1. **Pre-publish Check** (`ocax_check.ps1`)
   - Validates source files exist
   - Checks positioning consistency
   - Checks for risk patterns
   - If FAIL → Abort release

2. **Generate Pack** (`ocax_publish_pack.ps1`)
   - Reads source files
   - Generates release files
   - If FAIL → Abort release

3. **Git Push** (`ocax_git_push.ps1`)
   - Stages all changes
   - Commits with timestamp
   - Pushes to remote

---

## Flow Diagram

```
Start
  │
  ├─> Run ocax_check.ps1
  │     │
  │     ├─ FAIL ──> ABORT
  │     │
  │     └─ PASS ──> Continue
  │
  ├─> Run ocax_publish_pack.ps1
  │     │
  │     ├─ FAIL ──> ABORT
  │     │
  │     └─ PASS ──> Continue
  │
  └─> Run ocax_git_push.ps1
        │
        ├─ FAIL ──> Summary (partial success)
        │
        └─ PASS ──> Summary (complete success)
```

---

## Success Output Example

```
========================================
OCAX Release All-in-One Script
========================================

[STEP 1/3] Running pre-publish check...
----------------------------------------
[OK] Check completed: PASS

[STEP 2/3] Generating publish pack...
----------------------------------------
[OK] Pack generation completed: PASS

[STEP 3/3] Running git push...
----------------------------------------
[OK] Git push completed: PASS

========================================
RELEASE SUMMARY
========================================

Check Result:    PASS
Pack Result:     PASS
Git Push:        PASS

Final Status: RELEASE COMPLETE
```

---

## Error Handling

| Step | On Failure | Action |
|------|-------------|--------|
| Check | Script exits | Release aborted |
| Pack | Script exits | Release aborted |
| Git Push | Shows warning | Continues to summary |

---

## Individual Scripts

If you want to run steps individually:

```powershell
# Step 1: Check only
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_check.ps1

# Step 2: Pack only (after check passes)
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_publish_pack.ps1

# Step 3: Git push only (after pack)
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_git_push.ps1
```

---

*OCAX Release All Command v1.0*
