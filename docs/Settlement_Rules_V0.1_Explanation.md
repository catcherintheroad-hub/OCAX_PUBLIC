# Settlement Rules V0.1 设计说明

## 1. 概述

本文档解释 Settlement Rules V0.1 的设计目的和使用场景。

---

## 2. Settlement Rules 与其他协议的关系

### 2.1 三大协议

| 协议 | 角色 | 说明 |
|------|------|------|
| **Workflow Asset Card** | 供给侧 | 定义工作流和验收规则 |
| **Order Schema** | 需求侧 | 订单全生命周期 |
| **Settlement Rules** | 结算侧 | 定义结算流程和规则 |

### 2.2 配合关系

```
Order Schema (执行完成)
         ↓
Acceptance Rules (验收通过)
         ↓
Settlement Rules (结算)
         ↓
payout → 节点收款
```

---

## 3. Settlement Rules 核心作用

### 3.1 结算流程

```
验收通过 (acceptance_status = auto_review_passed)
    ↓
计算金额:
  - order_price: 订单价格
  - platform_fee: 平台手续费 (5%)
  - settlement_amount: 结算金额 = order_price - platform_fee
    ↓
生成结算记录
    ↓
执行 payout → 节点收款
```

### 3.2 金额流转

```
order_price = 50 Tokens
    │
    ├──→ platform_fee = 5% = 2.5 Tokens
    │
    └──→ settlement_amount = 47.5 Tokens
              │
              └──→ payout → 节点账户
```

---

## 4. 字段分类

### 4.1 基础标识
- settlement_rule_id, order_id
- order_template_id, workflow_id

### 4.2 结算金额
- order_price, platform_fee
- escrow_amount, settlement_amount
- refund_amount, payable_amount

### 4.3 支付信息
- payout_method, payout_address
- payout_status, transaction_id
- payout_date

### 4.4 结算条件
- payment_threshold, minimum_payment_amount
- max_retries, retry_interval_seconds
- max_payout_period_days

### 4.5 审计日志
- settlement_report_template
- report_generated_at, last_verified_at

---

## 5. 结算状态机

```
pending → processed → completed
    ↓
   failed → retry
    ↓
  refunded
```

---

## 6. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| V0.1 | 2026-03-15 | 初始版本 |

---

*版本: V0.1*
*更新日期: 2026-03-15*
