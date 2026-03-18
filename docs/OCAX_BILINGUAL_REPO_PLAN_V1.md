# OCAX Bilingual Repo Plan v1

**Version**: 1.0  
**Purpose**: Bilingual Repository Structure  
**Last Updated**: 2026-03-18

---

## Current State

Current repository is English-only. Need to add Chinese support for wider audience.

---

## Proposed Structure

```
OCAX_PUBLIC/
├── README.md              # Bilingual entry (EN primary)
├── README_CN.md          # Chinese version
├── docs/
│   ├── en/              # English docs (existing)
│   │   ├── status.md
│   │   ├── validator.md
│   │   └── ...
│   └── zh/              # Chinese docs (to create)
│       ├── status.md
│       ├── validator.md
│       └── ...
```

---

## README Bilingual Entry Requirements

### Top Section (Bilingual)

```
# OCAX

> English: Task verification for AI agents
> 中文: AI 任务验证网络

---

## Quick Summary

English: OCAX verifies AI agent task completion. Execution ≠ Completion. Validation = Completion.

中文: OCAX 验证 AI 代理任务完成。执行 ≠ 完成。验证 = 完成。

---

## Core Links

| English | 中文 |
|---------|------|
| [Status Overview](./docs/en/status.md) | [项目状态](./docs/zh/status.md) |
| [Validator](./docs/en/validator.md) | [验证器](./docs/zh/validator.md) |
| [Demo](./docs/en/demo.md) | [演示](./docs/zh/demo.md) |
```

---

## Priority Files for Bilingual

### Phase 1: High Priority (Week 1)

| # | File | Why |
|---|------|-----|
| 1 | README.md | First impression |
| 2 | README_CN.md | Chinese audience |
| 3 | docs/en/status.md | Project overview |
| 4 | docs/zh/status.md | Chinese overview |
| 5 | docs/en/validator.md | Core concept |
| 6 | docs/zh/validator.md | Chinese core |

### Phase 2: Medium Priority (Week 2-3)

| # | File | Why |
|---|------|-----|
| 1 | docs/en/passport.md | Second core concept |
| 2 | docs/zh/passport.md | Chinese version |
| 3 | docs/en/demo.md | Demo script |
| 4 | docs/zh/demo.md | Chinese demo |
| 5 | docs/en/launch.md | Launch post |
| 6 | docs/zh/launch.md | Chinese launch |

### Phase 3: Lower Priority (Week 4+)

- Messaging pack
- Skill market copy
- Homepage copy
- Other docs

---

## Implementation Guide

### Step 1: Create Directory Structure

```bash
mkdir -p docs/en docs/zh
```

### Step 2: Migrate Existing English Docs

```bash
mv docs/*.md docs/en/
```

### Step 3: Create Chinese Versions

Create zh/ versions of priority files:
- status.md
- validator.md
- passport.md
- demo.md
- launch.md

### Step 4: Update README

Make bilingual entry point with navigation to both languages.

---

## English Primary Principle

**Rule:** English is primary. All docs exist in English first, then Chinese translation.

**Reason:** GitHub default is English. Chinese is supplementary.

---

## Summary

### Phase 1 Files

| File | Language | Priority |
|------|----------|----------|
| README.md | EN | P0 |
| README_CN.md | CN | P0 |
| docs/en/status.md | EN | P0 |
| docs/zh/status.md | CN | P0 |
| docs/en/validator.md | EN | P0 |
| docs/zh/validator.md | CN | P0 |

### Phase 2 Files

| File | Language | Priority |
|------|----------|----------|
| docs/en/passport.md | EN | P1 |
| docs/zh/passport.md | CN | P1 |
| docs/en/demo.md | EN | P1 |
| docs/zh/demo.md | CN | P1 |
| docs/en/launch.md | EN | P1 |
| docs/zh/launch.md | CN | P1 |

---

## Quick Start

```bash
# Create dirs
mkdir -p docs/en docs/zh

# Move existing docs
mv docs/*.md docs/en/

# Create Chinese versions
# (manual translation)
```

---

*OCAX Bilingual Repo Plan v1.0*
