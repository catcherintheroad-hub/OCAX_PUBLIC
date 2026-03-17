# Acceptance Rules V0.1 设计说明

## 1. 概述

本文档解释 Acceptance Rules V0.1 的设计目的和使用场景。

---

## 2. Acceptance Rules 与其他协议的关系

### 2.1 三大协议

| 协议 | 角色 | 说明 |
|------|------|------|
| **Workflow Asset Card** | 供给侧 | 定义工作流的输入输出和验收规则 |
| **Order Schema** | 需求侧 | 订单执行和验收状态 |
| **Acceptance Rules** | 验收侧 | 定义如何检查和判定执行结果 |

### 2.2 配合关系

```
Workflow Asset Card (定义验收规则)
         ↓
    acceptance_rules 字段
         ↓
Order Schema (执行时引用)
         ↓
Acceptance Rules (实际检查)
         ↓
生成 acceptance_report + acceptance_score
```

---

## 3. Acceptance Rules 是自动验收闭环的核心

### 3.1 验收流程

```
Order 执行完成 → output_submitted
    ↓
系统加载对应的 Acceptance Rules
    ↓
执行 machine_check_rules
    ↓
计算 acceptance_score
    ↓
判定: PASS / FAIL / RETRY / MANUAL_REVIEW
    ↓
更新 Order 的 acceptance_status
```

### 3.2 三类结果

| 结果类型 | 条件 | 后续动作 |
|---------|------|----------|
| **PASS (通过)** | score >= threshold | settlement → 结算 |
| **FAIL (失败)** | score < 60 或关键检查失败 | refund → 退款 |
| **RETRY (重试)** | 可重试的错误 | 重新执行任务 |
| **MANUAL (人工)** | 60-80 分边缘情况 | 人工审核 |

### 3.3 为什么 Acceptance Rules 重要

- **自动化**: 无需人工介入
- **标准化**: 统一验收标准
- **可量化**: 评分机制
- **可追溯**: 完整的检查报告

---

## 4. 字段分类

### 4.1 基础标识
- acceptance_rule_id, workflow_id
- rule_set_name, whitelist_status

### 4.2 检查范围
- target_output_schema
- required_output_fields
- file_type_requirements

### 4.3 机审规则
- machine_check_rules: 机器检查规则列表
- field_completeness_rules: 字段完整性
- format_validation_rules: 格式验证
- threshold_rules: 阈值规则
- consistency_rules: 一致性规则

### 4.4 评分与判定
- score_threshold: 通过阈值 (默认 80)
- scoring_weights: 各检查项权重
- pass_conditions: 通过条件
- fail_conditions: 失败条件
- retryable_fail_conditions: 可重试条件
- manual_review_conditions: 人工审核条件

### 4.5 执行与审计
- acceptance_timeout_seconds: 验收超时
- report_template: 报告模板
- generated_report_fields: 报告字段

---

## 5. 示例: 电商上新工作流验收

### 5.1 检查项

| 检查项 | 类型 | 权重 |
|--------|------|------|
| output_pdf 存在 | file_exists | 40% |
| file_size 范围 | file_size | 20% |
| page_count >= 1 | pdf_pages | 20% |
| 字段完整 | field_present | 20% |

### 5.2 判定

- **通过**: score >= 80
- **失败**: score < 60 或 required_file_missing
- **重试**: temporary_file_lock
- **人工**: score 60-80

---

## 6. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| V0.1 | 2026-03-15 | 初始版本 |

---

*版本: V0.1*
*更新日期: 2026-03-15*
