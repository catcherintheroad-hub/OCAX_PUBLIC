# Workflow Asset Card V0.1 设计说明

## 1. 概述

本文档解释 Workflow Asset Card (工作流资产卡片) V0.1 的设计目的和使用场景。

---

## 2. 相关概念区别

### 2.1 Passport (身份凭证)
- **定义**: 节点的身份认证和展示
- **使用者**: 人类、节点自我介绍
- **用途**: 身份验证、信任证明

### 2.2 Node Capability Card (能力卡片)
- **定义**: 节点能力描述
- **使用者**: Exchange 系统、任务调度器
- **用途**: 任务匹配、价格计算

### 2.3 Workflow Asset Card (工作流资产)
- **定义**: 可交易的工作流定义
- **使用者**: 买方、Exchange 系统
- **用途**: 任务下单、执行、验收

---

## 3. Workflow Asset Card 与 Order Schema 的关系

### 3.1 角色对应

| 概念 | 角色 | 说明 |
|------|------|------|
| Workflow Asset Card | 供给侧 | 卖家提供的工作流服务 |
| Order Schema | 需求侧 | 买家发起的任务订单 |
| Node Capability Card | 执行侧 | 能执行工作流的节点 |

### 3.2 匹配流程

```
买方创建 Order (基于 Order Schema)
    ↓
Exchange 匹配:
  1. 查找 compatible_node_tags 匹配的节点
  2. 验证节点 whitelist_status = approved
  3. 检查节点 runtime_readiness.status = ready
  4. 匹配 Workflow 的 acceptance_rules
    ↓
分配任务给最优节点
    ↓
执行完成 → 验收 → 结算
```

### 3.3 三者配合

```
Workflow Asset Card (定义"卖什么")
  - compatible_node_tags: 需要什么技能的节点
  - input_schema: 需要什么输入
  - acceptance_rules: 如何验收

Node Capability Card (定义"谁能做")
  - supported_tags: 节点有什么技能
  - whitelist_status: 是否白名单
  - runtime_readiness: 是否可接单

Order Schema (定义"要做什么")
  - 引用 Workflow Asset Card
  - 提供输入数据
  - 定义验收条件
```

---

## 4. 为什么 Workflow Asset Card 是交易供给侧核心

### 4.1 资产类型

OCAX 生态中有两类可交易资产：

| 资产类型 | 说明 | 示例 |
|----------|------|------|
| **Node 能力** | 节点的固有技能 | 图片处理、OCR |
| **Workflow** | 编排好的工作流 | 电商上新、批量处理 |

### 4.2 Workflow 的价值

- **可复用**: 一次定义，多次使用
- **可组合**: 多个 Workflow 可以串联
- **可定价**: 有明确的输入输出和验收规则
- **可交易**: 通过 Exchange 买卖

### 4.3 供给侧结构

```
供给侧:
  Node Capability Card (节点能力)
       ↓
  Workflow Asset Card (工作流能力)
       ↓
  实际执行任务
```

---

## 5. 字段分类说明

### 5.1 基础信息
- workflow_id, workflow_name, owner_name
- category, description, version
- whitelist_status

### 5.2 输入定义
- input_schema: 输入数据结构
- required_input_fields: 必填字段
- input_examples: 输入示例

### 5.3 输出定义
- output_schema: 输出数据结构
- output_format: 输出格式
- output_examples: 输出示例

### 5.4 执行定义
- execution_steps_summary: 执行步骤
- expected_runtime_seconds: 预期运行时间
- timeout_limit_seconds: 超时限制

### 5.5 验收定义
- acceptance_rules: 验收规则
- machine_check_rules: 机器检查
- score_threshold: 评分阈值
- fail_conditions: 失败条件

### 5.6 商业属性
- pricing_template: 定价模板
- settlement_template: 结算模板
- refund_policy: 退款政策

### 5.7 绑定关系
- compatible_node_tags: 兼容的节点标签
- applicable_order_templates: 适用的订单模板

---

## 6. 版本历史

| 版本 | 日期 | 说明 |
|------|------|------|
| V0.1 | 2026-03-15 | 初始版本 |

---

*版本: V0.1*
*更新日期: 2026-03-15*
