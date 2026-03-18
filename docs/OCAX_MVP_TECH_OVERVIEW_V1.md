# OCAX MVP Technical Overview - Public Summary v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

OCAX MVP is built as a simple, fast, single-repo application.

---

## Technology

| Layer | Choice |
|-------|--------|
| Frontend + Backend | Next.js 14 |
| Database | SQLite (file-based) |
| Auth | Email + password |
| Deployment | Cloud (Vercel + Railway) |

**Why**: Fast to build, free tier available, one repo to manage.

---

## Architecture

```
Browser → Next.js App → SQLite Database
```

Simple. No microservices. No complex infrastructure.

---

## Database

7 tables covering:
- Users and roles
- Node applications and nodes
- Tasks and assignments
- Checkpoints and settlements

---

## Deployment

| Service | Cost |
|---------|------|
| Frontend/API | Free (Vercel) |
| Database | ~$5/month |
| Domain | ~$10-15/year |
| **Total** | **~$5/month** |

---

## Build Timeline

| Week | What |
|------|------|
| Week 1 | Foundation + Admin |
| Week 2 | Node Provider + Task Creation |
| Week 3 | Checkpoints + Settlement |
| Week 4 | Polish + Deploy |

**MVP ready in 4 weeks.**

---

## What's NOT in MVP

- No real-time updates (polling instead)
- No public marketplace (whitelist only)
- No payment gateway (credit system)
- No mobile app (web only)
- No auto-reassignment (manual handoff)

---

## Summary

| Element | Decision |
|---------|----------|
| Stack | Next.js + SQLite |
| Repo | Single |
| Cost | ~$5/month |
| Time to MVP | 4 weeks |

---

*This is a simplified technical overview.*
