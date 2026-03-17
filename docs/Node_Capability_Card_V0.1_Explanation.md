# Node Capability Card V0.1 设计说明

## 1. 概述

本文档解释 Node Capability Card (节点能力卡片) V0.1 的设计目的和使用场景。

---

## 2. Passport vs Node Capability Card 区别

### 2.1 Passport (身份凭证)

| 特性 | 说明 |
|------|------|
| **定位** | 节点的身份认证和展示 |
| **使用者** | 人类查看、节点自我介绍 |
| **用途** | 身份验证、分享给他人、信任证明 |
| **更新频率** | 较低（创建后很少更新） |
| **隐私程度** | 较高（可公开） |

**核心字段**:
- passport_id (UUID)
- node_id, node_name, owner_name
- 基础设施信息
- 信誉评分

### 2.2 Node Capability Card (能力卡片)

| 特性 | 说明 |
|------|------|
| **定位** | 节点能力描述，用于平台交易撮合 |
| **使用者** | Exchange 系统、任务调度器 |
| **用途** | 任务匹配、价格计算、信任评估 |
| **更新频率** | 高（实时更新运行状态） |
| **隐私程度** | 较低（平台内部使用） |

**核心字段**:
- 基础设施能力 (CPU/GPU/并发)
- 运行能力 (队列时间、执行时间)
- 商业属性 (价格、结算)
- 风控属性 (处罚状态、信任分)

---

## 3. 为什么分开设计

### 3.1 职责分离

- **Passport**: "我是谁" - 静态身份信息
- **Capability Card**: "我能做什么" - 动态能力信息

### 3.2 更新频率不同

- Passport 很少变化
- Capability Card 频繁更新（运行状态、队列情况）

### 3.3 使用场景不同

- Passport: 人工查看、分享
- Capability Card: 系统自动撮合

---

## 4. Node Capability Card 如何被 Exchange 使用

### 4.1 任务匹配流程

```
买方发起订单
    ↓
Exchange 查询 Capability Card 库
    ↓
匹配条件:
  - supported_tags 包含所需技能
  - whitelist_status = approved
  - runtime_readiness.status = ready
  - max_concurrency > 0
    ↓
计算价格:
  - price_floor (最低价)
  - estimated_value_per_day
  - reputation_score 权重
    ↓
选择最优节点
    ↓
分配任务
```

### 4.2 风控筛选

```
节点风控检查:
  - penalty_status = false (无处罚)
  - suspension_status = false (未暂停)
  - trust_score >= 60 (信任分合格)
  - success_rate >= 0.8 (成功率合格)
```

### 4.3 结算依据

```
任务完成后:
  - 查询 completed_tasks (累计)
  - 查询 success_rate (成功率)
  - 查询 settlement_rate (结算费率)
  - 计算: 任务报酬 × 结算率
```

---

## 5. 字段分类说明

### 5.1 基础身份
- node_id, node_name, owner_name: 身份标识
- whitelist_status: 白名单状态 (pending/approved/rejected/suspended)

### 5.2 基础设施能力
- CPU/GPU/内存/存储
- network_profile: 网络能力

### 5.3 运行能力
- runtime_readiness: 实时就绪状态
- supported_tags: 技能列表
- max_concurrency: 并发能力
- avg_queue_time_seconds: 排队时间
- avg_execution_time_seconds: 执行时间

### 5.4 质量与信誉
- success_rate: 成功率
- reputation_score: 信誉分
- stability_score: 稳定性

### 5.5 商业属性
- estimated_value_per_day: 日价值
- settlement_account: 结算账户
- settlement_rate: 结算费率
- price_floor: 最低报价

### 5.6 风控属性
- trust_score: 信任分
- penalty_status: 处罚状态
- suspension_status: 暂停状态

---

## 6. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| V0.1 | 2026-03-15 | 初始版本 |

---

*版本: V0.1*
*更新日期: 2026-03-15*
