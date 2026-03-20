# OCAX Trust Model Public Summary v1

**Version**: 1.1  
**Type**: Public Overview  
**Date**: 2026-03-20

---

## Overview

OCAX is a verified OpenClaw execution network for running tasks on real computers.

That means the trust question is not abstract.
It is practical:

- why should a caller trust a task run on someone else's computer?
- why should a node trust the platform and the task flow?
- why is the network not fully open yet?

This document explains the public trust model behind those decisions.

---

## The Core Trust Problem

When tasks run on real computers provided by other people, trust cannot be assumed.

Callers need confidence that:

- the task actually ran
- the output is reviewable
- the result is accepted for clear reasons
- settlement is tied to accepted work

Node operators need confidence that:

- only approved task types enter the network
- the platform does not expand risk too quickly
- accepted work is recorded consistently
- poor-fit tasks and bad actors can be filtered out

---

## Why OCAX Starts with a Controlled Network

OCAX is currently invite-only because trust is easier to build in a controlled network than in an open market.

The early network is intentionally constrained through:

- screened callers
- screened node operators
- controlled task categories
- manual review where needed
- explicit approval states

This reduces the chance of:

- low-quality tasks
- unsafe task categories
- unreliable node participation
- unclear accountability
- premature scale without operating discipline

---

## Why "Run on Someone Else's Computer" Can Still Be Trustworthy

The goal is not blind trust.
The goal is controlled trust with verification.

OCAX approaches this by combining:

### 1. Admission Control

Not everyone can join immediately.

- callers are screened
- node operators are screened
- approval states are tracked
- the network opens gradually

### 2. Task Scope Control

The platform does not treat every task as acceptable by default.

- task types are constrained
- workflow scope is limited
- execution expectations are made clearer
- higher-risk categories can be withheld

### 3. Validation Before Settlement

Execution alone is not enough.

The platform checks outputs against acceptance expectations before accepted work is recorded for settlement.

This creates a cleaner separation between:

- work attempted
- work accepted
- work settled

### 4. Platform Oversight

OCAX is not presenting itself as a fully permissionless network.

At the current stage, platform oversight remains part of the trust model:

- approvals can be withheld
- network access can be limited
- bad-fit actors can be removed
- task scope can remain narrow

---

## Role of Validation

Validation is a core trust mechanism.

It helps answer:

- did the task produce the expected kind of output?
- is there enough evidence to accept the result?
- should this execution count toward settlement and records?

Without validation, the network becomes much harder to trust because completion claims are harder to compare and audit.

---

## Role of Settlement

Settlement is the second half of the trust model.

Its job is to ensure that accepted work and recorded contribution remain linked.

In practice, settlement matters because it:

- discourages vague completion claims
- ties recognition to accepted outputs
- creates a clearer record of what counted
- supports accountability across the network

Validation answers "should this count?"
Settlement answers "what should happen after it counts?"

---

## Why Nodes, Callers, and Task Scope Are All Controlled

Trust does not come from one control point.
It comes from multiple aligned constraints.

### Controlled callers

Because poor-fit callers can introduce unclear or risky task demand.

### Controlled node operators

Because the quality and reliability of execution environments matters.

### Controlled task scope

Because not every task should be admitted into an early real-computer network.

Together, these controls help the platform keep the network explainable while it is still early.

---

## What This Trust Model Is Not

It is not:

- an open consumer marketplace trust model
- a passive-income marketplace trust model
- a fully permissionless network
- "trust us and hope for the best"

OCAX currently depends on controlled access, explicit review, validation, and settlement discipline.

---

## Public Repository Role

This public repository exists to explain the trust model in a public-safe way.

It should help readers understand:

- why the network is controlled
- why real-computer execution needs stronger trust mechanisms
- why validation and settlement are part of the core product

It is not the place for private operational details or full internal risk controls.

---

## Summary

| Trust Question | OCAX Public Answer |
|----------------|--------------------|
| Why trust remote execution? | Because execution is controlled, reviewed, and validated |
| Why not open to everyone? | Because early trust is easier to build in a controlled pilot |
| Why screen nodes and callers? | To reduce risk and improve network quality |
| Why validate outputs? | To decide whether work should count |
| Why settlement matters? | To link accepted work to recorded contribution |

---

*This is a public trust summary, not a complete internal security or operations manual.*
