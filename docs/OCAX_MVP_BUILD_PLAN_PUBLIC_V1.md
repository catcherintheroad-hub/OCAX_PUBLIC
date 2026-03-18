# OCAX MVP Build Plan - Public Overview v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

How we plan to build the OCAX MVP. Clear phases, realistic timeline.

---

## Build Phases

| Phase | What | Duration |
|-------|------|----------|
| 1 | Foundation + Admin | Week 1 |
| 2 | Node Provider | Week 2 |
| 3 | Task Requester | Week 2-3 |
| 4 | Settlement + Handoff | Week 3 |
| 5 | Polish + Deploy | Week 4 |

**Total: 4 weeks to MVP.**

---

## Week 1: Foundation + Admin

**Goal**: Running app with login and admin controls.

- Project setup (Next.js + SQLite)
- Database (7 tables)
- Authentication
- Whitelist Queue (approve/reject nodes)
- Admin Dashboard
- Node Management

**Deliverable**: Admin can approve node applications and manage nodes.

---

## Week 2: Node Provider

**Goal**: Nodes can go online and work on tasks.

- Node Dashboard (status, reputation, earnings)
- Task Assignment (accept/reject)
- Task Detail (submit checkpoints)

**Deliverable**: Node provider goes online → accepts task → submits checkpoint.

---

## Week 3: Task Requester + Settlement

**Goal**: Requesters can create and monitor tasks.

- Task Dashboard (all tasks)
- Create Task form
- Task Detail (monitor progress, see settlement)
- Settlement calculation
- Reputation updates

**Deliverable**: Requester creates task → sees checkpoints → payment releases.

---

## Week 4: Polish + Launch

**Goal**: Ship working product.

- Manual handoff (admin assigns if node goes offline)
- Error handling
- Deployment to cloud
- Full loop test

**Deliverable**: Live MVP, one full loop per role.

---

## What's Included

| Feature | Included |
|---------|----------|
| Login/logout | ✅ |
| Admin whitelist review | ✅ |
| Node online/offline | ✅ |
| Task creation | ✅ |
| Checkpoint submission | ✅ |
| Settlement display | ✅ |
| Reputation tracking | ✅ |
| Manual handoff | ✅ |
| Cloud deployment | ✅ |

## What's NOT Included (MVP)

| Feature | Reason |
|---------|--------|
| Public task marketplace | Whitelist only |
| Auto-reassignment | Manual handoff |
| Real-time updates | Polling instead |
| Payment gateway | Credit system |
| Mobile app | Web only |

---

## Status

| Item | Status |
|------|--------|
| Documents | Complete |
| Build plan | Complete |
| Development | Not started |

---

*This is a simplified overview of the build plan.*
