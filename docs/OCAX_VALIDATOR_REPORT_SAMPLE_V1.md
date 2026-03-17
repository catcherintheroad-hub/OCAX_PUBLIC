# OCAX Validator Report Sample v1

**Version**: 1.0 (校正版)  
**Purpose**: Sample Validation Report Structure for Display  
**Last Updated**: 2026-03-17

> **Note**: This document shows the *structure* of a validation report. Fields marked as "sample value" are illustrative only and not confirmed real values.

---

## Report Title

> OCAX Validation Report - image_resize Workflow

---

## Order Information

| Field | Value | Status |
|-------|-------|--------|
| **Order ID** | OCAX-ORDER-20260317-e9b0c525 | Confirmed |
| **Workflow ID** | OCAX-WF-image-resize-001 | Confirmed |
| **Node ID** | OCAX-NODE-20260317-d453ebde | Confirmed |
| **Passport ID** | OCAX-PASSPORT-20260317-2f30f88d | Confirmed |
| **Validation Time** | 2026-03-17T15:38:10Z | Sample value |
| **Validator Version** | v1.0 | Confirmed |

---

## Input Summary

| Field | Value | Status |
|-------|-------|--------|
| Action | image_resize | Confirmed |
| Input File | input_1600x1200.jpg | Sample value |
| Input Format | JPEG | Sample value |
| Input Dimensions | 1600 × 1200 | Sample value |
| Target Width | 800 | Sample value |
| Target Height | 600 | Sample value |
| Target Format | PNG | Sample value |

---

## Output Summary

| Field | Value | Status |
|-------|-------|--------|
| Output File | output_800x600.png | Sample value |
| Output Format | PNG | Sample value |
| Output Dimensions | 800 × 600 | Sample value |
| Output File Size | 4,460 bytes | Sample value |

---

## Validation Checks

| # | Check | Result | Score | Status |
|---|-------|--------|-------|--------|
| 1 | **input_file_exists** | PASS | 100 | Sample structure |
| 2 | **input_file_readable** | PASS | 100 | Sample structure |
| 3 | **output_file_exists** | PASS | 100 | Sample structure |
| 4 | **output_file_readable** | PASS | 100 | Sample structure |
| 5 | **output_format_valid** | PASS | 100 | Sample structure |
| 6 | **output_dimensions_match** | PASS | 100 | Sample structure |
| 7 | **output_file_not_empty** | PASS | 100 | Sample structure |

---

## Acceptance Result

| Field | Value | Status |
|-------|-------|--------|
| **Validation Status** | **PASS** | Confirmed logic |
| **Total Checks** | 7 | Sample structure |
| **Passed Checks** | 7 | Sample structure |
| **Failed Checks** | 0 | Sample structure |
| **Final Score** | **100 / 100** | Sample structure |
| **Pass/Fail判定** | **PASS** | Confirmed logic |
| **判定原因** | 7/7 检查项全部通过 | Confirmed logic |

---

## Settlement Eligibility

| Field | Value | Status |
|-------|-------|--------|
| **Settlement Eligible** | ✅ YES | Confirmed |
| **Reason** | Acceptance Status = PASS | Confirmed |
| **Settlement Mode** | credits | Confirmed |

### CR Release Calculation

| Component | Value | Status |
|-----------|-------|--------|
| Base CR | 50 | Confirmed |
| Bonus CR (30%) | 15 | Confirmed |
| **Total CR to Release** | **65 CR** | Confirmed |

> **Confirmed**: 验收通过才释放 CR。image_resize 结算 CR = 65。

---

## Passport Growth Impact

> **Note**: The following shows the *structure* of how Passport updates. Specific values are sample/illustrative.

| Field | Sample Value | Status |
|-------|--------------|--------|
| **Trust Points (TP)** | [value updated] | Sample structure |
| **Credits (CR)** | [value updated] | Sample structure |
| **Perfect Score Count** | [incremented] | Sample structure |
| **Consecutive Passes** | [incremented] | Sample structure |
| **Total Tasks Completed** | [incremented] | Sample structure |

### TP Impact

> **Note**: TP increment rules are defined in Credits Economy v3. The specific TP gain for this validation depends on current rules.

TP impact is recorded according to current growth rules:
- Acceptance PASS → +5 TP
- Perfect Score → +10 TP
- Consecutive Passes → additional TP

---

## Final Conclusion

> **VALIDATION PASSED**
>
> This is the confirmed logic: 
> - If acceptance status = PASS → settlement eligible
> - Settlement eligible → CR released
> - CR released → Passport updated
>
> **Confirmed**: 验收通过才释放 CR。CR 释放后更新 Passport。

---

## Why This Report Matters

### 1. Proof of Execution (Confirmed)

This report proves that the node actually completed the task. Not just "said" it completed. But **verified** by an independent validation layer.

### 2. Immutable Record (Confirmed)

Every validation report is stored. It cannot be altered. It becomes part of the node's history in Passport.

### 3. Automated Settlement (Confirmed)

The CR release is not manual. It's triggered by the validation result. **PASS** → release. **FAIL** → no release.

### 4. Growth Traceable (Confirmed)

Every task completion updates TP, CR, Level, and Weight. Nodes earn their reputation through verified work, not claims.

### 5. No Dispute (Confirmed)

If a node says "I did it" but the validation report shows FAIL, the node gets nothing. **Execution ≠ Completion. Validation = Completion.**

---

## Sample JSON Output

> **Note**: This is sample structure. Values are illustrative.

```json
{
  "validation_id": "OCAX-VAL-20260317-e9b0c525",
  "order_id": "OCAX-ORDER-20260317-e9b0c525",
  "workflow_id": "OCAX-WF-image-resize-001",
  "node_id": "OCAX-NODE-20260317-d453ebde",
  "validation_timestamp": "2026-03-17T15:38:10Z",

  "acceptance_status": "PASS",
  "acceptance_score": 100,
  "total_checks": 7,
  "passed_checks": 7,
  "failed_checks": 0,

  "settlement_eligible": true,
  "credits_to_release": 65,

  "passport_updates": {
    "tp_gain": "[value per current rules]",
    "cr_gain": 65,
    "new_level": "[calculated from TP]",
    "new_tp": "[previous + gain]",
    "new_cr": "[previous + gain]"
  }
}
```

---

## Summary: Confirmed vs Sample

### Confirmed Facts (in current context)

| 内容 | 状态 |
|------|------|
| Workflow = image_resize | ✅ 确认 |
| 验收通过才释放 CR | ✅ 确认 |
| image_resize = 65 CR | ✅ 确认 |
| Validator 输出结构化验收结果 | ✅ 确认 |
| PASS → settlement_eligible = true | ✅ 确认 |
| CR 释放后更新 Passport | ✅ 确认 |

### Sample / Illustrative

| 内容 | 状态 |
|------|------|
| 具体 TP 数值 | 示例结构 |
| 具体 CR 余额变化 | 示例结构 |
| 验证时间戳 | 示例值 |
| 输入/输出文件具体信息 | 示例结构 |

---

*OCAX Validator Report Sample v1.0 (校正版)*
