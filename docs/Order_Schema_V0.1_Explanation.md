# Order Schema V0.1 设计说明

## 1. 概述

本文档解释 Order Schema V0.1 的设计目的和使用场景。

---

## 2. Order Schema 与其他协议的关系

### 2.1 三大协议

| 协议 | 角色 | 说明 |
|------|------|------|
| **Workflow Asset Card** | 供给侧 | 定义"卖什么"（工作流服务） |
| **Node Capability Card** | 执行侧 | 定义"谁能做"（节点能力） |
| **Order Schema** | 需求侧 | 定义"要做什么"（订单） |

### 2.2 连接关系

```
┌─────────────────────────────────────────────────────────────┐
│                    Order Schema                            │
│  (买方发起订单，包含输入和验收条件)                        │
└─────────────────────────────────────────────────────────────┘
         ↓                        ↓                        ↓
┌──────────────────┐   ┌──────────────────┐   ┌──────────────────┐
│   workflow_id     │   │  required_node  │   │  acceptance_    │
│  (引用工作流)    │   │      _tags      │   │     rules        │
└──────────────────┘   └──────────────────┘   └──────────────────┘
         ↓                        ↓
┌──────────────────┐   ┌──────────────────┐
│ Workflow Asset   │   │ Node Capability  │
│      Card        │ ←→│      Card         │
│  (验证输入/输出) │   │  (匹配节点)      │
└──────────────────┘   └──────────────────┘
```

---

## 3. Order Schema 如何驱动派单

### 3.1 派单流程

```
Order 创建 (status: draft)
    ↓
Input 验证 → validation_status: passed
    ↓
支付 → status: paid
    ↓
派单匹配:
  - workflow_id → 获取 compatible_node_tags
  - required_node_tags → 匹配 Node Capability
  - fallback_node_ids → 备用节点
    ↓
分配节点 → assigned_node_id
    ↓
dispatched → running
```

### 3.2 匹配逻辑

```
订单要求: required_node_tags = ["gimp", "image_processing"]
节点能力: supported_tags = ["gimp", "python", "automation"]

匹配条件:
  1. required_node_tags ⊆ supported_tags
  2. whitelist_status = approved
  3. runtime_readiness.status = ready
  4. max_concurrency > 0
```

---

## 4. Order Schema 如何驱动验收

### 4.1 验收流程

```
执行完成 → output_submitted
    ↓
自动验收 (基于 Workflow 的 acceptance_rules):
  - machine_check_rules 自动检查
  - 计算 acceptance_score
    ↓
通过: acceptance_status = auto_review_passed
失败: acceptance_status = auto_review_failed
    ↓
settlement_status → released (结算)
         或 → refunded (退款)
```

### 4.2 评分计算

```
acceptance_score = f(machine_check_results)
  - 每个 check 通过得 100/N 分
  - score_threshold 决定是否通过
  - 0-100 分
```

---

## 5. Order Schema 如何驱动结算

### 5.1 结算流程

```
验收通过 → settlement_status: released
    ↓
计算金额:
  - order_price: 订单价格
  - platform_fee: 平台手续费 (例如 5%)
  - settlement_amount: 结算金额 = order_price - platform_fee
    ↓
结算给节点 → settlement_status: released
    ↓
订单完成 → status: settled
```

### 5.2 金额流转

```
order_price = 50 Tokens
    │
    ├──→ platform_fee = 5% = 2.5 Tokens
    │
    └──→ settlement_amount = 47.5 Tokens
              │
              └──→ 节点账户
```

---

## 6. 订单状态机

```
draft → pending_payment → paid → pending_dispatch 
    ↓                                          ↓
cancelled ←←←←←←←←←←←← dispatched → running
    ↓                              ↓
refunded ← auto_review_failed ← output_submitted
    ↓
settled ← auto_review_passed
```

---

## 7. 字段分类

### 7.1 订单基础身份
- order_id, order_template_id, workflow_id
- customer_id, status, created_at

### 7.2 输入参数层
- input_payload, parameter_version
- attached_assets, validation_status

### 7.3 撮合与派单层
- priority, nodes_required, required_node_tags
- assigned_node_id, fallback_node_ids
- dispatch_strategy, retry_count

### 7.4 执行层
- execution_id, started_at, completed_at
- execution_logs, output_payload

### 7.5 验收层
- acceptance_status, acceptance_score
- acceptance_report, fail_reason

### 7.6 财务与结算层
- order_price, escrow_amount
- settlement_amount, platform_fee
- refund_amount, settlement_status

---

## 8. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| V0.1 | 2026-03-15 | 初始版本 |

---

*版本: V0.1*
*更新日期: 2026-03-15*
