# OCAX Local Commands v1

**Version**: 1.0  
**Purpose**: PowerShell Commands Guide  
**Last Updated**: 2026-03-17

---

## Quick Start

### 1. Run Pre-publish Check

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_check.ps1
```

**Purpose**: Check source files, positioning, core logic, and risk patterns

**Success Output**:
```
========================================
OCAX Pre-Publish Check
========================================

[1/5] Checking source files...
  [OK] README
  [OK] LAUNCH
  [OK] PACK
  [OK] SKILL

[2/5] Checking main positioning...
  [OK] Files have content

[3/5] Checking sub positioning...
  [OK] Contains Node

[4/5] Checking Core Logic...
  [OK] Contains Validator

[5/5] Checking risk patterns...
  [OK] No market risk
  [OK] No TP increment risk

========================================
Summary
========================================
PASS: ready to publish

[PASS] README
[PASS] LAUNCH
[PASS] PACK
[PASS] SKILL
[PASS] Main Positioning
[PASS] Sub Positioning
[PASS] Core Logic
[PASS] Risk Check
```

---

### 2. Generate Publish Pack

```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_publish_pack.ps1
```

**Purpose**: Extract content from source files and generate release files

**Success Output**:
```
========================================
OCAX Publish Pack Generator
========================================

[1/4] Checking source files...
  [OK] README
  [OK] LAUNCH
  [OK] PACK
  [OK] SKILL

[2/4] Reading source files...
  [OK] Reading completed

[3/4] Generating output files...
  [OK] D:\OCAX\release\github\README_READY.md
  [OK] D:\OCAX\release\skill\SKILL_READY.md
  [OK] D:\OCAX\release\posts\LAUNCH_SHORT.txt
  [OK] D:\OCAX\release\posts\LAUNCH_STANDARD.txt
  [OK] D:\OCAX\release\github\RELEASE_SUMMARY.md

[4/4] Done!

========================================
Publish Pack Generated!
========================================
```

---

## Complete Commands

```powershell
# Run check
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_check.ps1

# Generate pack
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_publish_pack.ps1
```

---

## Recommended Workflow

1. Run check first
```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_check.ps1
```
2. If PASS, generate pack
```powershell
powershell -ExecutionPolicy Bypass -File D:\OCAX\scripts\ocax_publish_pack.ps1
```
3. Check generated files in release directory

---

## Generated Files Location

```
D:\OCAX\release\
├── github\
│   ├── README_READY.md
│   └── RELEASE_SUMMARY.md
├── skill\
│   └── SKILL_READY.md
└── posts\
    ├── LAUNCH_SHORT.txt
    └── LAUNCH_STANDARD.txt
```

---

*OCAX Local Commands v1.0*
