# OCAX-Passport

> 节点的可验证成长资产卡

---

## New Positioning

**OCAX-Passport** 是节点的可验证成长资产卡。

它不只是身份编号。它记录：
- 节点完成了多少任务
- 验收通过率是多少
- 信誉积分 (TP) 有多少
- 当前等级是什么
- 匹配权重是多少

---

## What Passport Stores

Passport 记录这些数据：

### 基础信息
- Node ID
- Passport ID
- 硬件配置 (CPU/GPU/内存)
- 操作系统

### 成长数据
- Trust Points (TP)
- Credits (CR)
- 当前等级
- 完成任务数
- 验收通过率
- 连续通过次数
- 满分次数

### 轨迹数据
- 每次任务的验收报告
- 积分奖励历史
- 等级晋升记录

---

## Why Growth Matters

**为什么一个节点值得被相信？**

因为它有 **可验证的成长资产卡**，而不是只有一个身份编号。

普通节点的问题：
- 说自己很强
- 没有任何证据
- 积分随便发

OCAX-Passport 的答案：
- **每完成一个任务，都有验收报告**
- **每通过一次验收，TP 自动增加**
- **等级越高，匹配权重越大**
- **数据公开可查，无法伪造**

---

## Why It Is an Asset Card

Passport 之所以叫「资产卡」，因为它记录的是 **可变现的成长**：

| 资产 | 说明 |
|------|------|
| **TP** | 信誉资产，越高等级越高 |
| **CR** | 经济资产，可用于结算 |
| **Level** | 等级资产，决定派单优先级 |
| **Weight** | 权重资产，1.0x ~ 2.0x |

这些不是数字。是节点的 **可验证能力证明**。

---

## Relationship with Validator

**Validator 产出 → Passport 记录**

每 Validator 完成一次验收，Passport 就更新一次：
- 验收通过 → TP + 信誉分
- 验收失败 → TP - 扣分
- 连续通过 → TP + 连击奖励

没有 Validator 的验收，Passport 不会更新。

---

## Relationship with Settlement

**Validator 确认通过 → Settlement 释放积分 → Passport 记录**

积分释放流程：
1. Node 执行任务
2. Validator 验收
3. 验收通过 → Settlement 释放 CR
4. CR 到账 → Passport 更新余额

**结算 = Validator 验收确认 + Passport 记录确认**

---

## Current Example Snapshot

当前节点的 Passport 数据（2026-03-17）：

| 字段 | 值 | 说明 |
|------|-----|------|
| **TP** | 75 | 信誉积分 |
| **CR** | 117 | 可用积分 |
| **Level** | L1 Bronze | 当前等级 |
| **Weight** | 1.0x | 匹配权重 |
| **完成任务** | 2 | 2 个 workflow |
| **验收通过率** | 100% | 2/2 通过 |
| **距 L2** | 25 TP | 再完成 1 个任务可达 |

---

## Growth Path

| 等级 | TP 要求 | 权重 | 节点画像 |
|------|---------|------|---------|
| L1 Bronze | 0-99 | 1.0x | 新手 |
| L2 Silver | 100-499 | 1.2x | 有经验 |
| L3 Gold | 500-1999 | 1.5x | 高手 |
| L4 Platinum | 2000+ | 2.0x | 大神 |

---

## 传播口号

### 主口号

> 节点能力，看得见。

### 副口号

> 有 Passport，有成长，有资产。

### 卖点

1. **可验证** - 每次执行都有验收报告
2. **可追溯** - TP/CR 积分有完整历史
3. **可成长** - 等级越高，权重越大

---

*OCAX-Passport v2 | 2026-03-17*
