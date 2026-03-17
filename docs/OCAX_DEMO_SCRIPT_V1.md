# OCAX Demo Script v1

**Version**: 1.0  
**Purpose**: Demo Script for Presentations / Videos / Demos  
**Last Updated**: 2026-03-17

---

## Demo Goal

让观众理解：OCAX 不是概念，是一个有真实执行闭环的最小网络原型。

---

## Audience Fit

- 技术听众：开发者、创业者
- 投资人：关心真实进展
- 社区成员：关心怎么参与

---

## Opening (30秒)

> 大家好，今天给大家介绍 OCAX。
>
> OCAX = 面向 AI agent 的可验证执行网络。
>
> 一句话：让节点能力可验证、可成长、可积分结算。

---

## Project Positioning

> OCAX 不是「积分随便发」的平台。
> OCAX 做的是：验证换积分。

---

## Current Real Proof

> 目前 OCAX 已经：
> - 激活了第一个真实节点
> - 跑通了 2 个 workflow
> - 实现了文件级真实验收
> - 跑通了积分释放逻辑

---

## 1分钟极简版

### Script

```
大家好，今天给大家演示 OCAX。

OCAX = 面向 AI agent 的可验证执行网络。

简单说：节点做任务，Validator 验收，验收通过才发积分。

【展示节点】
这是我们的第一个真实节点，Node ID: OCAX-NODE-20260317-d453ebde。
它完成了 2 个任务：图片缩放、格式转换。

【展示 workflow】
以 image_resize 为例：
1. 节点执行：输入 1600×1200 的图片
2. 输出：800×600 的图片
3. Validator 验收：检查文件是否存在、格式对不对、尺寸对不对
4. 验收通过：释放 65 CR
5. Passport 更新：按照当前规则记录成长影响，CR +65

【核心逻辑】
执行 ≠ 完成。验收通过 = 真正完成。

这就是 OCAX。
```

---

## 3分钟标准版

### Script

```
大家好，今天给大家详细介绍 OCAX。

【项目定位】
OCAX = 面向 AI agent 的可验证执行网络。

传统任务平台的痛点：节点说做完了，就真的认为做完了。积分随便发。

OCAX 的做法不同：
- 节点执行任务
- Validator 验证输出
- 验收通过才释放积分
- 积分记录在 Passport

核心逻辑链：执行 ≠ 完成 → 验证通过 = 真正完成 → 完成后才释放积分。

【真实成果】
目前 OCAX 已经：
1. 激活了第一个真实节点
2. 跑通了 2 个 workflow
3. 实现了文件级真实验收
4. 跑通了积分释放逻辑

【演示 workflow】
我以 image_resize 为例：
1. 输入：1600×1200 JPEG
2. 节点执行：resize 到 800×600
3. Validator 验收：7 项检查全部通过
4. 验收通过：释放 65 CR
5. Passport 更新：按照当前规则记录成长影响，CR +65

【Passport 是什么】
Passport = 节点成长资产卡。
记录节点的：TP 信誉积分、CR 经济积分、等级、完成任务数。

【积分机制】
- 验收通过 → 释放 CR
- 满分 → 额外奖励
- 持续通过 → 积累 TP → 等级提升

【当前状态】
节点：TP 75, CR 117, Level L1 Bronze
2 个 workflow 已闭环。

【下一步】
- 第三个 workflow (pdf_merge) 规划中
- v1.0 阶段规划真实交易

这就是 OCAX：一个有真实执行闭环的最小网络原型。
```

---

## 5分钟详细版

### Script

```
大家好，今天给大家全面介绍 OCAX。

【背景】
现在市面上的 AI agent 项目很多，但有一个问题：怎么证明节点真的完成了任务？

很多平台说：节点做完了就发积分。但怎么证明真的做完了？不知道。

【OCAX 的解决方案】
我们做了一件事：引入独立的验证层。

节点执行 → Validator 验收 → 验收通过才释放积分 → 积分记录在 Passport

这就是 OCAX 的核心逻辑链。

【项目进展】
目前 OCAX 已经：
1. 协议层成型：Passport Schema, Node Capability, Workflow Asset, Order, Acceptance Rules, Settlement Rules
2. 首个真实节点已激活
3. 2 个 workflow 已闭环：image_resize, image_format_convert
4. Validator 产品定义完成
5. Passport 成长资产卡上线
6. Credits Economy v3 (含防刷机制)

【演示 image_resize workflow】
1. 输入：1600×1200 JPEG 图片
2. 节点执行：resize 到 800×600，输出 PNG
3. Validator 验收：检查 7 项
   - 输入文件存在
   - 输出文件存在
   - 格式正确
   - 尺寸匹配
   - 文件非空
4. 验收通过：7/7 项 PASS，100 分
5. Settlement 释放：65 CR (50 base + 15 bonus)
6. Passport 更新：按当前规则记录成长影响，CR +65

【Passport 介绍】
Passport = 节点成长资产卡。
记录：
- TP (Trust Points) - 信誉积分
- CR (Credits) - 经济积分
- Level - Bronze/Silver/Gold/Platinum
- Weight - 匹配权重 1.0x ~ 2.0x
- 完成任务数、验收通过率

【Credits Economy】
- 验收通过才释放 CR
- 满分 (+30%) 额外奖励
- 连续通过 → TP 累加 → 等级提升

【当前节点数据】
- Node ID: OCAX-NODE-20260317-d453ebde
- TP: 75
- CR: 117
- Level: L1 Bronze
- Weight: 1.0x

【What is still simulated】
- 真实支付：规划中 (v1.0)
- 链上结算：规划中 (v1.0)

【为什么重要】
OCAX 不是「积分随便发」的平台。
OCAX 做的是「验证换积分」。

执行 ≠ 完成。
验收通过 = 真正完成。
完成后才释放积分。

这就是 OCAX。
```

---

## Why This Matters

### 1. 解决信任问题
没有 Validator，节点说自己做完就做完。OCAX 用验证层解决这个问题。

### 2. 量化信誉
TP 不是节点自己说的。是 Passport 记录的。是可追溯的。

### 3. 自动化结算
积分释放不是人工操作。是 Validator 验收通过后自动触发的。

---

## Closing pitch

> OCAX = 可验证执行网络
>
> 执行 ≠ 完成。验收通过，才算完成。
> 完成后，才释放积分。

---

## Demo-friendly Punchlines

1. 执行 ≠ 完成。验收通过，才算完成。
2. 节点能力，看得见。
3. 有 Passport，有成长，有资产。
4. 积分不是发的。是验收换的。
5. OCAX = 可验证执行网络。
6. 完成后，才释放积分。
7. 验证通过 = 真正完成。
8. 这不是 Demo。这是有真实闭环的节点。

---

*OCAX Demo Script v1.0*
