# OCAX Task Classification - Public Summary v1

**Version**: 1.0  
**Type**: Public Overview  
**Date**: 2026-03-18

---

## Overview

Not all tasks are the same. OCAX classifies tasks by sensitivity to ensure:
- The right tasks go to the right nodes
- Your data is handled appropriately
- Trust levels match task requirements

---

## Task Levels

### Level 1: Public Tasks

**For**: Web scraping, public data processing, open API calls

**Who can run**: Any node on the network

**What it exposes**: Nothing sensitive

**Examples**:
- Scrape public product prices
- Process public datasets
- Aggregate open API data

---

### Level 2: Internal Tasks

**For**: Business operations, internal reports, batch processing

**Who can run**: Verified nodes only (no open network)

**What it exposes**: Internal business data (not public, not PII)

**Examples**:
- Generate internal reports
- Process operational data
- Run batch transformations

---

### Level 3: Sensitive Tasks

**For**: Customer data, financial data, user information

**Who can run**: Private/enterprise nodes only

**What it exposes**: PII, financial, or user data

**Examples**:
- Process customer orders
- Generate financial reports
- Handle support tickets

**Requires**: Extra approval, encryption, audit logging

---

### Level 4: Restricted Tasks

**For**: Critical systems, credentials, security operations

**Who can run**: Direct execution only (never remote)

**What it exposes**: Infrastructure access, secrets

**Examples**:
- SSH into servers
- Access production databases
- Manage credentials

**Never runs on**: Remote nodes

---

## Quick Reference

| Task Type | Trust Level | Node Type | Auto-schedule |
|-----------|-------------|-----------|---------------|
| Public | None | Any | ✅ |
| Internal | Verified | Whitelist+ | ✅ |
| Sensitive | Private | Private only | ❌ |
| Restricted | Direct | Same-machine | ❌ |

---

## How It Works

### When You Create a Task

1. Select task sensitivity level
2. System shows required trust level
3. Task routes to appropriate nodes
4. Higher sensitivity = more controls

### Your Data Protection

| Level | Protection |
|-------|------------|
| Public | Basic |
| Internal | Encryption + verification |
| Sensitive | Full encryption + audit + retention limits |
| Restricted | Never leaves your machine |

---

## Summary

OCAX ensures:
- Public tasks run fast on any node
- Internal tasks run on verified nodes
- Sensitive tasks only go to trusted private nodes
- Critical tasks never run remotely

---

*This is a simplified overview. Full technical details are in internal documentation.*
