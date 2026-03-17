# OCAX Credits Settler Integration Guide

**版本**: 0.1  
**日期**: 2026-03-17

---

## 1. Settler 模式

OCAX Settler 支持两种结算模式:

| 模式 | 说明 | 状态 |
|------|------|------|
| **credits** | 积分结算 | ✅ 可用 |
| **simulation** | 模拟结算 | ✅ 可用 |
| **real** | 真钱结算 | 🔶 待对接 |

---

## 2. Credits 模式数据结构

### 2.1 结算请求

```json
{
  "settlement_mode": "credits",
  "order_id": "OCAX-ORDER-xxx",
  "workflow_id": "OCAX-WF-xxx",
  "acceptance_status": "AUTO_REVIEW_PASSED",
  "acceptance_score": 95.0,
  "customer_id": "customer-001",
  "node_id": "OCAX-NODE-xxx",
  
  "pricing": {
    "base_cr": 50,
    "bonus_cr": 20,
    "total_cr": 70
  },
  
  "from_customer": {
    "debit_cr": -70,
    "balance_after": 930
  },
  
  "to_node": {
    "credit_cr": 70,
    "balance_after": 570
  }
}
```

### 2.2 验收失败时

```json
{
  "settlement_mode": "credits",
  "order_id": "OCAX-ORDER-xxx",
  "acceptance_status": "AUTO_REVIEW_FAILED",
  
  "from_customer": {
    "debit_cr": 0,
    "reason": "acceptance_failed"
  },
  
  "to_node": {
    "credit_cr": 0,
    "reason": "no_reward_on_failure"
  },
  
  "penalty": {
    "node_debit_cr": 10,
    "node_tp_deduct": 5
  }
}
```

---

## 3. Credits Settler API

### 3.1 结算接口

```python
from settlement_engine import SettlementEngine, SettlementMode

engine = SettlementEngine()

# Credits 模式结算
result = engine.settle_with_credits(
    order_id="OCAX-ORDER-xxx",
    workflow_id="OCAX-WF-xxx",
    acceptance_status="AUTO_REVIEW_PASSED",
    acceptance_score=95.0,
    customer_id="customer-001",
    node_id="OCAX-NODE-xxx"
)
```

### 3.2 积分余额查询

```python
# 查询节点积分
balance = engine.get_node_credits(node_id="OCAX-NODE-xxx")
print(f"CR: {balance.credits}, TP: {balance.trust_points}, Rank: {balance.rank}")

# 查询客户积分
customer_balance = engine.get_customer_credits(customer_id="customer-001")
```

### 3.3 积分转账

```python
# 积分转账
tx = engine.transfer_credits(
    from_id="customer-001",
    to_id="OCAX-NODE-xxx",
    amount=50,
    reason="task_completion"
)
```

---

## 4. Workflow CR 定价

### 4.1 当前支持

| Workflow | Base CR | 高分 Bonus | 满分 Bonus |
|----------|---------|------------|------------|
| image_resize | 50 | +20 | +50 |
| image_format_convert | 40 | +20 | +50 |

### 4.2 自定义定价

```python
# 设置自定义定价
engine.set_workflow_pricing("OCAX-WF-custom-001", base=60, high_score_bonus=25, perfect_bonus=60)
```

---

## 5. 防刷机制集成

### 5.1 奖励衰减

```python
# 检查连续任务次数
consecutive = engine.get_consecutive_task_count(node_id, workflow_id)
decay_multiplier = engine.calculate_decay(consecutive)

# 计算最终奖励
final_cr = base_cr * decay_multiplier
```

### 5.2 失败惩罚

```python
# 验收失败处理
if acceptance_status == "AUTO_REVIEW_FAILED":
    engine.apply_failure_penalty(
        node_id=node_id,
        customer_id=customer_id,
        order_id=order_id
    )
```

---

## 6. TP 等级计算

### 6.1 等级更新

```python
# 每次结算后更新等级
tp = engine.get_trust_points(node_id)
rank = engine.calculate_rank(tp)

# L1: 0-99, L2: 100-499, L3: 500-1999, L4: 2000+
```

### 6.2 等级权益

| Rank | TP | 匹配权重 |
|------|-----|----------|
| L1 | 0-99 | 1.0x |
| L2 | 100-499 | 1.2x |
| L3 | 500-1999 | 1.5x |
| L4 | 2000+ | 2.0x |

---

## 7. 使用示例

### 7.1 完整结算流程

```python
from settlement_engine import SettlementEngine

engine = SettlementEngine()

# 1. 验收通过后调用结算
result = engine.settle_with_credits(
    order_id="OCAX-ORDER-20260317-160241",
    workflow_id="OCAX-WF-image-format-convert-001",
    acceptance_status="AUTO_REVIEW_PASSED",
    acceptance_score=100.0,
    customer_id="customer-002",
    node_id="OCAX-NODE-20260317-d453ebde"
)

# 2. 返回结算结果
print(result.settlement_status)  # COMPLETED
print(result.credits_transferred)  # 90 (40 + 50 bonus)
print(result.node_new_rank)  # L2
```

### 7.2 验收失败场景

```python
# 验收失败，不释放 CR
result = engine.settle_with_credits(
    order_id="OCAX-ORDER-xxx",
    acceptance_status="AUTO_REVIEW_FAILED",
    ...
)

print(result.credits_transferred)  # 0
print(result.penalty_applied)  # True
```

---

## 8. 配置

### 8.1 启用 Credits 模式

```json
{
  "settlement": {
    "default_mode": "credits",
    "allow_simulation": true,
    "allow_real": false
  },
  
  "pricing": {
    "image_resize": {"base": 50, "high_score": 20, "perfect": 50},
    "image_format_convert": {"base": 40, "high_score": 20, "perfect": 50}
  },
  
  "anti_abuse": {
    "decay_enabled": true,
    "failure_penalty_enabled": true,
    "suspicious_threshold": 100
  }
}
```

---

## 9. 待实现

- [ ] Credits Ledger (数据库)
- [ ] CR 充值接口
- [ ] 定时任务 (TP 稳定性奖励)
- [ ] 人工审核队列

---

*文档版本: 0.1 | 最后更新: 2026-03-17*
