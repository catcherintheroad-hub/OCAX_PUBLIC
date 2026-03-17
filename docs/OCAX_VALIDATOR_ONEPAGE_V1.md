# OCAX-Validator

> Structured verification for real execution results

---

## What it is

OCAX-Validator 是任务执行结果的**结构化验证引擎**。

它不做任务执行。它只验证：
- 任务是否真的完成了
- 输出是否符合预期
- 验收是否通过

---

## What problem it solves

普通任务平台的痛点：
- 节点说"做完了"
- 平台就真的认为"做完了"
- 没有第三方验证
- 积分随便发

OCAX 的解决方案：
- **执行 ≠ 完成**
- **Validator 验证通过 = 真正完成**
- **完成才释放积分**

---

## What it verifies

Validator 验证这些：

| 验证项 | 说明 |
|--------|------|
| 输入文件存在 | 文件真的在那里 |
| 输出文件存在 | 任务真的产出了 |
| 格式正确 | PNG 是 PNG，JPEG 是 JPEG |
| 尺寸匹配 | 800×600 不会变成 100×100 |
| 规则命中 | 满足 Acceptance Rules |

验证后输出：
- **PASS** → 可以结算
- **FAIL** → 不给积分
- **MANUAL** → 人工复核

---

## Why it matters in OCAX

OCAX = **可验证执行网络**

Validator 让 OCAX 具备：

1. **可验证**
   每一次执行都有验收报告

2. **可追溯**
   验收结果记入 Passport

3. **可量化**
   积分释放由验证结果自动触发

---

## Current supported workflows

| Workflow | 验证什么 |
|----------|---------|
| **image_resize** | 尺寸精确、格式转换 |
| **image_format_convert** | 格式正确、色彩空间转换 |

---

## Why settlement depends on validation

**核心逻辑链**：

```
Node 执行任务
     ↓
Validator 验收
     ↓
通过？ → PASS → 释放 CR
     ↓
失败？ → FAIL → 不给积分
     ↓
持续通过 → 积累 TP → 等级提升
```

**没有 Validator 的 PASS，就没有积分。**

这是 OCAX 与「积分随便发」平台的核心区别。

---

## Core Message

> 执行 ≠ 完成。验收通过，才算完成。完成后，才释放积分。持续完成，才积累信誉。

---

*OCAX-Validator v1.0 | 2026-03-17*
