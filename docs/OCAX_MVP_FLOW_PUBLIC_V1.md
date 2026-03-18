# OCAX MVP Flow - Public Overview v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

How users move through OCAX MVP. Simple, role-based, minimum loops.

---

## Three Roles, Three Entry Points

| Role | Entry Page | First Action |
|------|-----------|--------------|
| Admin | Admin Dashboard | Review pending applications |
| Node Provider | Node Dashboard | Go online |
| Task Requester | Task Dashboard | Create or view tasks |

---

## Admin Flow

1. Login → Admin Dashboard
2. See alerts (pending apps, failed tasks)
3. Click "Review Applications" → Whitelist Queue
4. Approve or reject
5. Return to Dashboard

**Key pages**: Dashboard, Whitelist Queue, Node Management, Task Detail

---

## Node Provider Flow

1. Login → Node Dashboard
2. Toggle online
3. Wait for assignment
4. Accept task → Task Detail
5. Submit checkpoints as work progresses
6. View earnings on Dashboard

**Key pages**: Node Dashboard, Task Assignment, Task Detail

**What they see**:
- Tier and reputation (Dashboard)
- Current task (Dashboard)
- Checkpoint progress (Task Detail)
- Earnings (Dashboard)

---

## Task Requester Flow

1. Login → Task Dashboard
2. Click "Create Task"
3. Fill form → Submit
4. Monitor on Task Detail
5. See checkpoints verified in real-time
6. Payment released after completion

**Key pages**: Task Dashboard, Create Task, Task Detail

**What they see**:
- All tasks (Dashboard)
- Checkpoint progress (Task Detail)
- Assigned node info (Task Detail)
- Settlement breakdown (Task Detail)

---

## What Happens When Things Go Wrong

### Node Goes Offline

- Node sees: "Task reassigned. X checkpoints credited."
- Requester sees: "Task paused. Reassigning..."
- Admin sees: Alert on Dashboard

### Checkpoint Rejected

- Node sees: "Checkpoint invalid. Please resubmit."
- Requester not notified (handled by platform)

### Settlement Pending

- Node sees: "Pending: X credits" on Dashboard
- Released after verification

---

## Minimum Loops

### Node Provider Loop

```
Go Online → Accept Task → Submit Checkpoints → View Earnings
```

### Task Requester Loop

```
Create Task → Monitor Progress → Task Completes → View Settlement
```

### Admin Loop

```
Review Application → Approve/Reject → Monitor System
```

---

## Summary

| Element | Decision |
|---------|----------|
| Entry pages | 3 |
| Core pages | 8 |
| Settlement visibility | Node + Requester |
| Reputation visibility | Node only |

---

*This is a simplified overview of user flows.*
