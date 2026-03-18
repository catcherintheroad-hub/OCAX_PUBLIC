# OCAX Permission & Data Protection - Public Summary v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

Your data and tasks are protected on OCAX. We use multiple layers of security, not just encryption.

---

## Security Layers

### Data in Transit

All data moving between systems is encrypted (TLS).

### Data at Rest

Data stored on platform servers is encrypted.

### Secrets Management

Your credentials and API keys never touch external nodes. Instead:
- Platform acts as a proxy for sensitive calls
- Credentials are stored securely
- All credential usage is logged

---

## Node Permissions

### What Nodes Can Access

| Task Type | Node Access |
|-----------|-------------|
| Public tasks | Compute only |
| Internal tasks | Compute + limited storage |
| Sensitive tasks | Restricted access with monitoring |
| Restricted tasks | Never runs on external nodes |

### Default: No Access

Nodes start with no permissions. They only get what a specific task needs.

---

## Your Data Protection

### Task Content

- Encrypted on platform servers
- Decrypted only when needed
- Deleted after task completion

### Intermediate Results

- Stored on platform (not node)
- Automatically cleaned up
- Encrypted during processing

---

## Audit & Transparency

### What We Log

- When tasks start and finish
- Errors and failures
- API access for sensitive tasks
- Node assignments

### What We Don't Log

- Task content
- Your data
- Credentials or secrets

---

## Summary

| Protection | How It Works |
|-----------|--------------|
| Encryption | TLS in transit, AES at rest |
| Secrets | Platform proxy, never on node |
| Permissions | Default-deny, minimal exposure |
| Audit | Full logging for sensitive tasks |
| Isolation | Tasks don't see each other |

---

*This is a simplified overview. Full technical details are in internal documentation.*
