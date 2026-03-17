# OCAX Public Repository Manifest v1

**Version**: 1.0  
**Purpose**: Manifest of Public Showcase Repository  
**Last Updated**: 2026-03-18

---

## Repository Type

**SHOWCASE REPOSITORY** - For external display only

This repository contains only public-facing content about OCAX. Core execution code, internal automation, and sensitive data are NOT included.

---

## Copied Content

### Root Level

| File | Status |
|------|--------|
| README.md | ✅ Copied |
| .gitignore | ✅ Copied |

### docs/

65+ documentation files including:
- OCAX_STATUS_OVERVIEW_V1.md
- OCAX_VALIDATOR_V1.md
- OCAX_PASSPORT_SKILL_V2.md
- OCAX_LAUNCH_POST_V1.md
- OCAX_MESSAGING_PACK_V1.md
- OCAX_DEMO_SCRIPT_V1.md
- OCAX_SKILL_MARKET_FINAL_V1.md
- And more...

### schemas/

6 JSON schema files:
- Acceptance_Rules_V0.1_Standard.json
- Node_Capability_Card_V0.1_Standard.json
- Order_Schema_V0.1_Standard.json
- Passport_Schema_V0.1_Standard.json
- Settlement_Rules_V0.1_Standard.json
- Workflow_Asset_Card_V0.1_Standard.json

### demo_inputs/

2 sample input files:
- input_1024x768.png
- input_1600x1200.jpg

### demo_outputs/

2 sample output files:
- output_800x600.png
- output_format_converted.jpg

### release/

5 generated release files:
- README_READY.md
- RELEASE_SUMMARY.md
- SKILL_READY.md
- LAUNCH_SHORT.txt
- LAUNCH_STANDARD.txt

---

## Excluded Content

The following content is explicitly NOT included in this public repository:

### Core Implementation (EXCLUDED)

| Directory/File | Reason |
|---------------|--------|
| src/ | Core platform code |
| scripts/ | Automation scripts |
| active_nodes/ | Node data and scripts |
| worker.py | Main worker |
| update_dashboard.py | Update script |

### Sensitive Data (EXCLUDED)

| Directory/File | Reason |
|---------------|--------|
| *.xlsx | Operations data |
| *_db.json | Database files |
| payment_config.py | Payment configuration |
| payment_gateway.py | Payment logic |

### Infrastructure (EXCLUDED)

| Directory/File | Reason |
|---------------|--------|
| Dockerfile | Internal infrastructure |
| docker-compose.yml | Internal infrastructure |
| nginx.conf | Internal infrastructure |
| prometheus.yml | Internal infrastructure |

### Legacy (EXCLUDED)

| Directory/File | Reason |
|---------------|--------|
| Legacy_Backup/ | Legacy files |

---

## Why This is a "Showroom" Not "Development" Repository

### Showroom Characteristics

- **Purpose**: External display and project introduction
- **Content**: Documentation, demos, schemas, sample data
- **Audience**: Developers, investors, community members
- **Safe**: No sensitive implementation details

### What This Repository Demonstrates

1. **Project Positioning** - What OCAX is and does
2. **Core Concepts** - Validator, Passport, Settlement
3. **Workflow Examples** - How workflows work
4. **Documentation** - Project status and guides
5. **Demo Materials** - Sample inputs and outputs
6. **Protocol Schemas** - Data structures

### What This Repository Does NOT Contain

1. ❌ Core execution code (src/)
2. ❌ Node management scripts (active_nodes/)
3. ❌ Automation workflows (scripts/)
4. ❌ Payment integration (payment_*.py)
5. ❌ Database files (*_db.json)
6. ❌ Operations data (*.xlsx)
7. ❌ Internal infrastructure (Docker, nginx, etc.)

---

## File Count

| Category | Count |
|----------|-------|
| Documentation | 65+ |
| Schemas | 6 |
| Demo Files | 4 |
| Release Files | 5 |
| Root Files | 2 |
| **Total** | **~80** |

---

*OCAX Public Repository Manifest v1.0*
