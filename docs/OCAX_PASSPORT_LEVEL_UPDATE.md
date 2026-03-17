# OCAX Passport Level Update Report

**日期**: 2026-03-17  
**节点**: OCAX-NODE-20260317-d453ebde

---

## 1. 当前节点积分摘要

| 指标 | 值 |
|------|-----|
| **Total TP** | 140 |
| **Current Level** | L2 (Silver) |
| **Credits Earned** | 190 |
| **Credits Balance** | 190 |
| **Completed Workflows** | 2 |
| **Perfect Score Count** | 2 |
| **Matching Weight** | 1.2x |

---

## 2. TP 来源明细

| 奖励类型 | TP | 说明 |
|----------|-----|------|
| 激活节点 | +50 | 注册奖励 |
| 满分通过 (image_resize) | +20 | 100分奖励 |
| 满分通过 (image_format_convert) | +20 | 100分奖励 |
| 首次成功 | +20 | 里程碑 |
| 连续通过 (2次) | +30 | 连击奖励 |
| **Total** | **140** | |

---

## 3. 等级规则

| 等级 | TP 区间 | 匹配权重 | 状态 |
|------|---------|----------|------|
| L1 (Bronze) | 0-99 | 1.0x | ❌ |
| **L2 (Silver)** | **100-499** | **1.2x** | ✅ 当前 |
| L3 (Gold) | 500-1999 | 1.5x | 🔜 需 360 TP |
| L4 (Platinum) | 2000+ | 2.0x | 🔜 需 1860 TP |

---

## 4. 为什么是 L2 (Silver)?

| 条件 | 值 |
|------|-----|
| 当前 TP | 140 |
| L2 最低要求 | 100 |
| 满足 L2? | ✅ 是 |
| 满足 L3? | ❌ (需 500) |

**结论**: 节点完成了 2 个真实 workflow，获得满分奖励，满足 L2 等级要求。

---

## 5. 升级路径

| 目标等级 | 需 TP | 当前 TP | 差值 |
|----------|-------|---------|------|
| L3 (Gold) | 500 | 140 | 360 |
| L4 (Platinum) | 2000 | 140 | 1860 |

---

## 6. Passport 成长属性

节点 Passport 已新增 economy 字段:

```json
{
  "economy": {
    "trust_points": 140,
    "current_level": "L2 (Silver)",
    "level_code": 2,
    "credits_earned": 190,
    "credits_balance": 190,
    "completed_real_workflows": 2,
    "perfect_score_count": 2,
    "consecutive_passes": 2,
    "matching_weight": "1.2x",
    "total_earned_tp": 140,
    "total_spent_tp": 0,
    "rewards_history": [...],
    "last_rewarded_at": "2026-03-17T16:02:41Z"
  }
}
```

---

## 7. 下一步

- [ ] 完成更多 workflow 获取 TP
- [ ] 达到 L3 (Gold) 等级
- [ ] 提升匹配权重到 1.5x

---

## 8. 文件位置

| 文件 | 路径 |
|------|------|
| Node Passport | `D:\OCAX\active_nodes\OCAX-NODE-20260317-d453ebde.json` |
| 更新脚本 | `D:\OCAX\active_nodes\update_passport_tp.py` |

---

*文档版本: 0.1 | 更新: 2026-03-17*
