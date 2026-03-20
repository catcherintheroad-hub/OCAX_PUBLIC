# OCAX MVP Public Overview v1

**Version**: 1.1  
**Type**: Public Overview  
**Date**: 2026-03-20

---

## What OCAX Is

OCAX is a verified OpenClaw execution network for running tasks on real computers.

Developers submit tasks that need real execution environments.
Node operators provide real computers running OpenClaw.
The platform validates results and records settlement after accepted execution.

This is the current product direction.

OCAX is not:

- a generic task marketplace
- a passive-income hardware product
- a broad public market for renting random spare devices

---

## Why OCAX Exists

Some OpenClaw and browser automation workflows do not fit neatly into:

- generic cloud instances
- headless VPS environments
- synthetic browser-only setups

They need:

- real computers
- real browsers
- real desktop context
- verifiable outputs

OCAX exists to coordinate that kind of execution more safely and more clearly.

---

## Why It Is Not Just Cloud / VPS

Cloud and VPS environments are useful, but they are not always enough.

OCAX is designed for cases where execution quality depends on:

- local machine context
- browser state on a real machine
- desktop-level interaction surfaces
- execution records that can be reviewed and accepted

That is why the project should be understood as a verified execution network, not just compute supply.

---

## Why Verification and Settlement Matter

In a real-computer execution network, "task started" and "task finished correctly" are not the same thing.

OCAX adds structure between execution and reward:

1. a task is submitted
2. a node runs it on a real computer
3. outputs are checked against acceptance expectations
4. only accepted work moves into settlement and records

Validation helps determine whether work should count.
Settlement helps determine what should be recorded or rewarded.

Together they make the network more reliable and more explainable.

---

## Controlled Pilot

OCAX is currently invite-only and controlled.

That is intentional.

The goal at this stage is not open scale.
The goal is to build a stable early network with:

- vetted callers
- vetted node operators
- controlled task scope
- safer operating conditions
- clearer acceptance and settlement discipline

---

## Who Should Understand or Try It First

OCAX is currently best suited for:

- OpenClaw advanced users
- automation developers
- teams that need real-computer execution environments
- vetted node operators who can provide stable machines

It is not currently designed as a broad public onboarding product for casual users.

---

## Core MVP Loop

```text
Caller submits task
-> Approved node runs task with OpenClaw on a real computer
-> Platform validates outputs
-> Settlement and records are updated
```

---

## MVP Roles

| Role | Responsibility |
|------|----------------|
| Caller | Submits tasks that need real-computer execution |
| Node Operator | Provides a real computer running OpenClaw |
| Platform | Controls admission, validates outputs, records settlement |

---

## What the MVP Is Optimizing For

The MVP is optimizing for:

- execution reliability
- clearer validation
- controlled access
- usable settlement records
- early operational trust

It is not optimizing for:

- broad public onboarding
- passive-income growth loops
- open marketplace liquidity
- maximum task volume

---

## Public Repository Role

This public repository is the companion explanation layer for OCAX.

It exists to provide:

- public-safe product explanations
- public schemas
- demo materials
- public-facing documentation

It exists so external readers can understand:

- what OCAX is
- why it uses real computers
- why validation and settlement matter
- why the network is currently controlled

It is not the full production application repository and it is not the deployment source of truth.

---

## Summary

| Element | Current Direction |
|---------|-------------------|
| Product type | Verified OpenClaw execution network |
| Execution environment | Real computers |
| Access model | Controlled pilot / invite-only |
| Trust basis | Validation + settlement + controlled admission |
| Public repo role | Companion showcase and documentation layer |

---

*This document is a public overview, not a full internal operating spec.*
