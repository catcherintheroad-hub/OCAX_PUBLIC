# OCAX MVP Data Model - Public Overview v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

OCAX MVP uses a simple data model optimized for the task collaboration network.

**7 core tables. No over-engineering.**

---

## Core Data Objects

### 1. User

**Purpose**: Account for all roles (admin, node provider, task requester).

| Fields | Notes |
|--------|-------|
| id, email, password | Basic account info |
| role | admin / node_provider / task_requester |
| status | active / suspended / deleted |

---

### 2. Node Application

**Purpose**: Track whitelist applications.

| Fields | Notes |
|--------|-------|
| user info | Who applied |
| hardware info | CPU, RAM, storage |
| status | pending / approved / rejected |

---

### 3. Node

**Purpose**: Approved device in the network.

| Fields | Notes |
|--------|-------|
| tier | bronze / silver / gold |
| reputation | completion rate, abandonment rate |
| status | online / offline / suspended |
| earnings | total earned |

---

### 4. Task

**Purpose**: Task created by requester.

| Fields | Notes |
|--------|-------|
| class | public / internal |
| status | pending → running → completed |
| price | total credits |
| checkpoints | number of checkpoints required |

---

### 5. Checkpoint

**Purpose**: Track progress within a task.

| Fields | Notes |
|--------|-------|
| sequence | checkpoint number |
| status | created / verified / invalid |
| payment | credits for this checkpoint |

---

### 6. Settlement

**Purpose**: Track payments.

| Fields | Notes |
|--------|-------|
| amount | gross amount |
| commission | platform cut |
| net_amount | what node receives |
| status | pending / released |

---

## Key Relationships

```
User → Node (1:N)
User → Task (1:N)
Task → Assignment → Checkpoint → Settlement
```

---

## What You Can See

### Node Dashboard Shows

- Your tier (Bronze/Silver/Gold)
- Completion rate
- Abandonment rate
- Total earnings
- Today's earnings

### Task Detail Shows

- Task status
- Assigned node
- Checkpoint progress
- Payment breakdown

---

## MVP Success Criteria (Revised)

| Metric | Target |
|--------|--------|
| Tasks completed | ≥ 10 |
| Checkpoint success rate | ≥ 80% |
| Node retention (30-day) | ≥ 70% |
| Audit log coverage | ≥ 95% |
| No confirmed data leaks | 0 |

---

## Summary

| Element | Value |
|---------|-------|
| Core tables | 7 |
| Indexes | 9 required |
| Over-engineering | None |
| MVP scope | Minimum viable |

---

*This is a simplified overview. Full schema in internal documentation.*
