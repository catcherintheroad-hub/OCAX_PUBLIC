# OCAX Task State Machine - Public Summary v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

When you submit a task on OCAX, it goes through clear stages. This ensures you always know what's happening, and the platform can recover if something goes wrong.

---

## Task States

### What Happens to Your Task

| State | What It Means |
|-------|---------------|
| Pending | Your task is created and waiting |
| Scheduled | A node accepted your task |
| Running | The node is working on it |
| Completed | Task finished successfully |
| Failed | Something went wrong |

---

## What Happens If Something Goes Wrong

### Node Goes Offline

| Scenario | What Happens |
|----------|--------------|
| Checkpoint exists | Task can resume on another node |
| No checkpoint | Task may need to restart |
| Sensitive task | Only rerouted to private nodes |

### Task Fails

| Scenario | What Happens |
|----------|--------------|
| Recoverable | Platform retries automatically |
| Non-recoverable | You'll be notified |
| User cancelled | Task stops immediately |

---

## Progress Tracking

### You'll Always Know

- When your task starts
- When it's running
- When it's completed
- If something goes wrong
- What the error was

### Notifications

- Task completed: Immediate notification
- Task failed: Immediate notification
- Retry scheduled: Notification
- Handoff occurred: Notification

---

## Reliability Features

### Checkpoints

Tasks save progress periodically. If a node goes offline:
- With checkpoint: Another node can continue
- Without checkpoint: Task may restart

### Auto-Retry

| Task Type | Retries |
|-----------|---------|
| Public | Up to 3 times |
| Internal | Up to 2 times |
| Sensitive | 1 time, private nodes only |

### Timeout Handling

If a task takes too long:
- Platform detects timeout
- Task is marked as timed out
- Platform can retry or notify you

---

## Summary

| Element | How It Works |
|---------|--------------|
| Status visibility | Always know task state |
| Recovery | Checkpoint + retry |
| Failover | Only with valid checkpoint |
| Sensitive tasks | Restricted routing |
| Notifications | Real-time updates |

---

*This is a simplified overview. Full technical details are in internal documentation.*
