# Passport Schema V0.1 设计说明 (修正版)

## 1. 概述

本文档解释 OCAX Passport Schema V0.1 的设计目的和字段含义。

### 1.1 设计目标

Passport Schema 是 OCAX 生态的身份凭证标准，用于：
- 唯一标识每个节点
- 量化节点能力和资产
- 建立信誉体系
- 支持任务匹配和交易

---

## 2. 核心字段说明

### 2.1 身份信息

| 字段 | 类型 | 说明 |
|------|------|------|
| passport_id | UUID | Passport 唯一标识，必须使用 UUID v4 格式 |
| node_id | string | 节点 ID |
| node_name | string | 节点名称 |
| owner_name | string | 所有者 |

### 2.2 基础设施

| 字段 | 类型 | 说明 |
|------|------|------|
| region | string | 区域 |
| ip_country | string | IP 国家 (ISO 3166-1 alpha-2) |
| operating_system | string | 操作系统 |
| cpu | string | CPU 型号 |
| gpu | string | GPU 型号 |
| memory_gb | number | 内存 (GB) |
| storage_gb | number | 存储 (GB) |

### 2.3 运行状态

| 字段 | 类型 | 说明 |
|------|------|------|
| runtime_readiness | boolean OR object | 就绪状态（支持两种形式）|
| uptime_hours | number | 累计运行时间 |
| supported_tags | array | 支持的技能标签 |

### 2.4 信誉体系

| 字段 | 类型 | 说明 |
|------|------|------|
| completed_tasks | integer | 完成任务数 |
| success_rate | number | 成功率 (0-1) |
| reputation_score | number | 信誉评分 (0-100) |

### 2.5 价值评估

| 字段 | 类型 | 说明 |
|------|------|------|
| estimated_value_per_day | number | 日价值 (Tokens) |
| recommended_order_types | array | 推荐订单类型 |

---

## 3. 验证规则

### 3.1 passport_id
- **格式**: UUID v4
- **示例**: 550e8400-e29b-41d4-a716-446655440000
- **错误**: passport_id 必须为有效的 UUID 格式

### 3.2 runtime_readiness
支持两种形式：

**形式1: 布尔值**
```json
true  // 就绪
false // 未就绪
```

**形式2: 对象**
```json
{
  "status": "ready",  // ready | not_ready | busy | offline
  "uptime_seconds": 7200,
  "last_check": "2026-03-15T01:20:00Z"
}
```

### 3.3 数值约束

| 字段 | 最小值 | 最大值 |
|------|--------|--------|
| success_rate | 0 | 1 |
| reputation_score | 0 | 100 |
| memory_gb | 0 | - |
| storage_gb | 0 | - |
| estimated_value_per_day | 0 | - |
| completed_tasks | 0 | - |
| uptime_hours | 0 | - |

---

## 4. 版本历史

| 版本 | 日期 | 修改内容 |
|------|------|----------|
| V0.1 | 2026-03-15 | 初始版本 |
| V0.1 (修正) | 2026-03-15 | passport_id 改为 UUID，runtime_readiness 支持布尔值 |

---

*版本: V0.1 (修正版)*
*更新日期: 2026-03-15*
