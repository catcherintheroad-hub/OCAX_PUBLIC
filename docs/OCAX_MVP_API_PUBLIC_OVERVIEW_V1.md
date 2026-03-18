# OCAX MVP API Overview - Public Summary v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

OCAX MVP uses a simple REST API for the task collaboration network.

**18 core APIs. No over-engineering.**

---

## Core API Groups

| Group | What It Does |
|-------|--------------|
| Auth | Login, logout |
| Node Application | Whitelist applications |
| Node | Device status, availability |
| Task | Task creation, management |
| Checkpoint | Progress tracking |
| Settlement | Payment tracking |

---

## Key APIs

### For Node Providers

| API | Purpose |
|-----|---------|
| GET /nodes/me | View my status |
| PATCH /nodes/me/status | Go online/offline |
| GET /task-assignments/me | View assigned tasks |
| POST /checkpoints | Save checkpoint |
| GET /settlements/me | View earnings |

### For Task Requesters

| API | Purpose |
|-----|---------|
| POST /tasks | Create task |
| GET /tasks/me | View my tasks |
| GET /settlements/me | View payments |

### For Admins

| API | Purpose |
|-----|---------|
| GET /node-applications | Review applications |
| PATCH /node-applications/:id | Approve/reject |
| GET /nodes | View all nodes |
| GET /settlements | View all payments |

---

## Audit Logging

### APIs That Are Logged

| API | What It Logs |
|-----|-------------|
| Node application | Application submitted |
| Application review | Admin decision |
| Task created | Task details |
| Checkpoint saved | Progress made |
| Settlement viewed | Payment accessed |

---

## Reputation Visibility

### Node Providers Can See

- Tier (Bronze/Silver/Gold)
- Completion rate
- Abandonment rate
- Reputation score

---

## Summary

| Element | Value |
|---------|-------|
| Core APIs | 18 |
| Auth | 3 |
| Node | 5 |
| Task | 3 |
| TaskAssignment | 3 |
| Checkpoint | 2 |
| Settlement | 2 |

### New APIs Added (v1.1)

| API | Purpose |
|-----|---------|
| PATCH /nodes/:id/status | Admin controls node status |
| POST /task-assignments | Admin manual assignment/handoff |
| GET /nodes/:id | Admin views node details |

---

*This is a simplified overview. Full API spec in internal documentation.*
