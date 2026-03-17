# OCAX Homepage Copy v1

**Version**: 1.0  
**Purpose**: Homepage / README / Landing Page  
**Last Updated**: 2026-03-17

---

## Hero Title (3 Candidates)

### Candidate A

> 让算力变成可验证的资产。

### Candidate B

> 你贡献算力，OCAX 验证结果。

### Candidate C

> 执行 ≠ 完成。验证通过，才算完成。

---

## Hero Subtitle

> OCAX - 面向 AI agent 的可验证执行网络

---

## Hero Description

OCAX 是一个让节点能力可验证、可成长、可积分结算的去中心化计算资源市场。

- 节点真的在执行任务
- Validator 真的在验证输出
- 验收通过才释放积分
- 积分记录在 Passport，形成成长轨迹

**这不是「积分随便发」。这是「验证换积分」。**

---

## Core Value Proposition

| 价值 | 说明 |
|------|------|
| **可验证** | 每次执行都有验收报告 |
| **可追溯** | Passport 记录完整成长历史 |
| **可量化** | 积分释放由验证结果自动触发 |
| **可成长** | 等级越高，匹配权重越大 |

---

## Why OCAX Matters

### 传统任务平台的痛点

- 节点说「做完了」
- 平台就真的认为「做完了」
- 没有第三方验证
- 积分随便发

### OCAX 的解决方案

- **执行 ≠ 完成**
- **Validator 验证通过 = 真正完成**
- **完成才释放积分**

---

## How OCAX Works

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Node      │────▶│  Validator  │────▶│ Settlement  │────▶│  Passport   │
│  executes   │     │  verifies   │     │ releases CR │     │  records    │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
    执行任务     →     验证输出     →     释放积分     →     记录成长
```

---

## Current Live Proof

| 已完成 | 状态 |
|--------|------|
| **1 个真实节点** | ✅ 已激活 |
| **2 个真实 workflow** | ✅ 已闭环 |
| **文件级真实验收** | ✅ 已跑通 |
| **积分释放逻辑** | ✅ 已验证 |

### 已验证的 Workflows

| Workflow | 输入 | 输出 | 验收 | 结算 |
|----------|------|------|------|------|
| image_resize | 1600×1200 JPEG | 800×600 PNG | 100分 PASS | 65 CR |
| image_format_convert | 1024×768 PNG | 1024×768 JPEG | 100分 PASS | 52 CR |

---

## Validator Section

> Validator = 验证层

Validator 对任务执行结果进行结构化验收。

- 输入/输出文件存在性验证
- 输出文件属性验证
- Acceptance Rules 命中判断
- Settlement eligibility 判断

**核心逻辑**：执行 ≠ 完成。Validator 验收通过，才算完成。

---

## Passport Section

> Passport = 成长资产卡

Passport 记录节点的成长轨迹。

| 数据 | 说明 |
|------|------|
| TP | 信誉积分，决定等级 |
| CR | 经济积分，可用于结算 |
| Level | 等级越高，权重越大 |
| Weight | 1.0x ~ 2.0x |

**为什么需要 Passport？** 因为「节点说自己很强」没有用。Passport 记录的是可验证的成长历史。

---

## Workflow Section

OCAX 已支持的 Workflow：

| Workflow | 类型 | 验证方式 |
|----------|------|---------|
| image_resize | 图片处理 | 文件尺寸、格式 |
| image_format_convert | 图片处理 | 文件格式、色彩空间 |

更多 Workflow 规划中...

---

## Current Status

| 功能 | 状态 |
|------|------|
| 节点激活 | ✅ 可用 |
| 任务执行 | ✅ 可用 |
| 自动验收 | ✅ 可用 |
| 积分结算 | ✅ 可用 |
| 真实支付 | 🔶 规划中 (v1.0) |

---

## Next Step

### 短期 (v0.3 - v0.5)

- 跑通第三个 workflow (pdf_merge)
- 完善 Credits Ledger
- 开放测试兑换

### 长期 (v1.0)

- 接入真实支付
- 引入链上结算
- 开放真钱交易

---

## Closing Line

> **OCAX = 可验证执行网络**
>
> 执行 ≠ 完成。验收通过，才算完成。完成后，才释放积分。

---

## CTA

### CTA version for Github

```markdown
[Star on GitHub](link) | [View Documentation](./docs) | [Try Demo](./demo)
```

### CTA version for community

> 想让你的算力变成可验证的资产？来 OCAX。

---

*OCAX Homepage Copy v1.0*
