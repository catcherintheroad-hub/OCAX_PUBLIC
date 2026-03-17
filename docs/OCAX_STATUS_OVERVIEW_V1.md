# OCAX Current Status Overview v1

**Version**: 1.0  
**Status**: Project Status Overview  
**Last Updated**: 2026-03-17

---

## Project Positioning

**OCAX = 面向 AI agent 的可验证执行网络**

一句话副定位：让节点能力可验证、可成长、可积分结算。

---

## Current Core Narrative

OCAX 不做「积分随便发」的平台。OCAX 做的是：

1. **真实执行** - 节点真的在跑任务
2. **真实验收** - Validator 验证输出是否合规
3. **积分结算** - 验收通过才释放积分
4. **节点成长** - TP 累积驱动等级提升

**核心逻辑链**：执行 ≠ 完成 → 验收通过 = 真正完成 → 完成后才释放积分 → 持续完成才积累信誉

---

## What Has Been Completed

| 类别 | 完成项 |
|------|--------|
| **协议层** | Passport Schema、Node Capability Card、Workflow Asset Card、Order Schema、Acceptance Rules、Settlement Rules |
| **节点** | 首个真实节点已激活 |
| **Workflow** | 2 个真实 workflow 已闭环 (image_resize, image_format_convert) |
| **Validator** | Validator v1 产品定义文档已完成 |
| **Passport** | Passport 成长资产卡 V2 文案已完成 |
| **Credits** | Credits Economy v3 (含防刷机制) |
| **第三个 Workflow** | pdf_merge 候选方案已完成 |

---

## Current Real Node

| 字段 | 值 |
|------|-----|
| **Node ID** | OCAX-NODE-20260317-d453ebde |
| **Passport ID** | OCAX-PASSPORT-20260317-2f30f88d |
| **硬件** | AMD64 (16核) + RTX 5060 + 31.8GB |
| **TP** | 75 |
| **CR** | 117 |
| **Level** | L1 Bronze |
| **Weight** | 1.0x |
| **距 L2** | 还差 25 TP |

---

## Current Real Workflows

| # | Workflow | 输入 | 输出 | 验收 | 结算 |
|---|----------|------|------|------|------|
| 1 | **image_resize** | 1600×1200 JPEG | 800×600 PNG | 100分 PASS | 65 CR |
| 2 | **image_format_convert** | 1024×768 PNG | 1024×768 JPEG | 100分 PASS | 52 CR |

---

## Validator Layer

Validator 作为 OCAX 的独立验证层，承担以下职责：

- 输入/输出文件存在性验证
- 输出文件属性验证
- Acceptance Rules 命中判断
- Settlement eligibility 判断
- 验收结果归档

**核心价值**：执行 ≠ 完成。Validator 验收通过，才算真正完成。

---

## Passport Growth Asset

Passport 记录节点的成长轨迹：

| 资产类型 | 说明 |
|----------|------|
| **TP (Trust Points)** | 信誉积分，决定等级 |
| **CR (Credits)** | 经济积分，可用于结算 |
| **Level** | 等级越高，匹配权重越大 |
| **Weight** | 1.0x ~ 2.0x |

**为什么需要 Passport？**  
因为「节点说自己很强」没有用。Passport 记录的是可验证的成长历史。

---

## Credits / TP Mechanism

### Credits (CR)

| 来源 | 规则 |
|------|------|
| 验收通过 | Base CR |
| 满分 (≥80分) | +30% |
| 连续通过 | 连击奖励 |

### Trust Points (TP)

| 来源 | 规则 |
|------|------|
| 验收通过 | +5 TP |
| 满分 | +10 TP |
| 连续通过 | +15 TP |

### 防刷机制

- 每日 TP 上限: 100
- 每日 CR 上限: 200
- 连续任务奖励衰减
- 验收失败不给 CR

---

## Current Public Messaging

### 一句话主定位

> OCAX - 面向 AI agent 的可验证执行网络

### 一句话副定位

> 让节点能力可验证、可成长、可积分结算

### 三大亮点

1. **真实执行 + 真实验收** - 已跑通 2 个 workflow，100% 验收通过
2. **节点成长体系** - Bronze → Silver → Gold → Platinum，等级越高权重越大
3. **积分化结算机制** - CR 积分，平滑升级到真钱

### 对外口号

> 执行 ≠ 完成。验收通过，才算完成。完成后，才释放积分。

---

## What Is Still Simulated

| 功能 | 状态 | 说明 |
|------|------|------|
| **真实支付** | 🔶 模拟 | 仅积分流通 |
| **真实托管** | 🔶 模拟 | 无链上托管 |
| **真实提现** | 🔶 模拟 | 无链上转账 |
| **链上结算** | 🔶 模拟 | 仅本地 JSON |

**说明**: 当前为「积分系统」，v1.0 阶段规划升级到「真实交易」。

---

## Next Priorities

| 优先级 | 任务 |
|--------|------|
| **P0** | 跑通第三个真实 workflow (pdf_merge) |
| **P1** | 实现更多 image 类 workflow |
| **P2** | 完善 Credits Ledger 数据库 |
| **P3** | 规划 v0.5 测试兑换 |
| **P4** | 规划 v1.0 真实交易 |

---

## Core Takeaway

**OCAX 不是概念。它已经是一个有真实执行闭环的最小网络原型。**

- 节点真的在执行任务
- Validator 真的在验收输出
- 验收通过才释放积分
- 积分记录在 Passport 里

**这不是「积分随便发」的平台。这是「可验证执行网络」。**

---

*OCAX Current Status Overview v1.0*
