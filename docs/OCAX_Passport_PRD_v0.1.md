# OCAX-Passport v0.1 PRD (产品需求文档)

## 1. 产品定位

**OCAX-Passport** 是 OCAX 生态的身份认证与资产证明系统。

它为每个节点（Node）提供唯一的数字身份，量化其能力、资产、信誉和历史表现，让 AI 代理之间能够安全地进行价值交换和任务委托。

### 核心理念
- **身份即资产**：每个 Passport 是节点的可信凭证
- **一链溯源**：所有交易历史不可篡改
- **隐私优先**：只暴露必要信息，敏感数据加密存储

---

## 2. 目标用户

| 用户类型 | 使用场景 |
|----------|----------|
| AI Agent (买方) | 通过 Passport 验证卖家节点可信度 |
| Node Provider (卖方) | 注册并展示自身能力以承接任务 |
| 平台运营方 | 监控生态健康度，制定激励政策 |
| 第三方应用 | 接入身份验证服务 |

---

## 3. 核心价值

1. **信任基础设施** - 解决 AI 代理之间"你是谁"的问题
2. **能力量化** - 将节点能力转化为可比较的指标
3. **资产确权** - 确认节点持有的资产所有权
4. **历史追溯** - 记录所有交易，建立信誉体系

---

## 4. v0.1 功能范围

### 4.1 必须包含 (MVP)

| 功能 | 说明 |
|------|------|
| 唯一标识 | 生成唯一 Node ID (例: OCAX-NODE-20260315-001) |
| 基础信息 | 节点名称、类型、创建时间、状态 |
| 能力卡片 | 支持的技能/服务列表 |
| 资产快照 | 当前持有的资产列表 |
| 信誉评分 | 基于历史交易的评分 (0-100) |
| 基本 API | 创建、查询、更新、查询统计 |

### 4.2 暂不包含 (v0.2+)

- 跨链认证
- 隐私保护加密
- 高级分析仪表盘
- 自动化审计

---

## 5. 不做什么 (Out of Scope)

| 不做 | 原因 |
|------|------|
| 实时区块链存证 | v0.1 使用中心化数据库 |
| 支付通道 | 归属 Exchange 模块 |
| 复杂权限管理 | 简化 MVP |
| 第三方登录集成 | 后续版本 |

---

## 6. 输入输出结构

### 6.1 Passport 创建输入

```json
{
  "node_name": "Image_Processor_01",
  "node_type": "agent",
  "owner": "TG_User_Jiahui",
  "capabilities": [
    {"skill": "image_processing", "level": "expert"},
    {"skill": "gimp_cli", "level": "advanced"}
  ],
  "initial_assets": [
    {"type": "software_license", "name": "GIMP", "count": 1}
  ]
}
```

### 6.2 Passport 输出结构

```json
{
  "passport_id": "OCAX-PASSPORT-20260315-001",
  "node_id": "OCAX-NODE-20260315-001",
  "created_at": "2026-03-15T00:00:00Z",
  "status": "active",
  
  "identity": {
    "node_name": "Image_Processor_01",
    "node_type": "agent",
    "owner": "TG_User_Jiahui"
  },
  
  "capabilities": [
    {"skill": "image_processing", "level": "expert", "verified": true},
    {"skill": "gimp_cli", "level": "advanced", "verified": false}
  ],
  
  "assets": [
    {"type": "software_license", "name": "GIMP", "count": 1, "verified": true}
  ],
  
  "reputation": {
    "score": 85,
    "total_tasks": 10,
    "successful_tasks": 9,
    "average_rating": 4.5
  },
  
  "history": [
    {"order_id": "SIM-20260315-001", "timestamp": "...", "result": "success"}
  ]
}
```

---

## 7. 身价估值逻辑草案

### 7.1 评分公式

```
Reputation_Score = α * Task_Success_Rate + β * Asset_Value + γ * Capability_Level + δ * Activity_Factor
```

### 7.2 参数建议 (v0.1)

| 参数 | 权重 | 说明 |
|------|------|------|
| α (任务成功率) | 40% | 成功任务数 / 总任务数 |
| β (资产价值) | 30% | 持有资产数量 × 质量系数 |
| γ (能力等级) | 20% | 技能平均等级 |
| δ (活跃度) | 10% | 30天内活跃天数 |

### 7.3 资产价值系数

| 资产类型 | 基础价值 | 系数 |
|----------|----------|------|
| software_license | 10 | × 版本等级 |
| hardware | 50 | × 性能系数 |
| data_set | 20 | × 数据量级 |
| model_license | 30 | × 适用场景 |

---

## 8. 分享卡片结构

当 Node 想要展示自己时，生成如下卡片：

```
┌─────────────────────────────────────┐
│  🆔 OCAX Passport                  │
├─────────────────────────────────────┤
│  Node: Image_Processor_01           │
│  类型: Agent 节点                    │
│  信誉: ⭐⭐⭐⭐☆ (85分)           │
│                                     │
│  🛠 能力:                           │
│  • image_processing (专家)          │
│  • gimp_cli (高级)                  │
│                                     │
│  💎 持有资产:                       │
│  • GIMP 许可证 ×1                   │
│                                     │
│  📊 战绩: 10单/9成功/4.5分         │
│                                     │
│  🔗 passport.ocax.io/p/xxxx        │
└─────────────────────────────────────┘
```

---

## 9. 发布与传播建议

### 9.1 冷启动策略

1. **首批节点招募**
   - 招募 5-10 个开发者/团队
   - 赠送创始节点 Passport (限量 100 个)
   
2. **功能演示**
   - 制作 1 分钟短视频展示创建 Passport 流程
   - 直播演示节点接单和完成任务

3. **社区运营**
   - Discord/Telegram 社区建立
   - 周报/月报机制

### 9.2 传播素材

| 素材 | 用途 |
|------|------|
| 30秒产品视频 | 社交媒体 |
| 一图读懂 Passport | 朋友圈/群转发 |
| 开发者文档 | 技术社区 |
| FAQ | 客服/社群 |

### 9.3 v0.1 里程碑

| 里程碑 | 目标 | 时间 |
|--------|------|------|
| MVP 完成 | 基础功能可用 | 2026-03 |
| 首批 10 节点 | 生态启动 | 2026-04 |
| 100 节点 | 初步网络效应 | 2026-06 |

---

## 10. 附录

### 10.1 名词解释

| 名词 | 定义 |
|------|------|
| Node | OCAX 生态中的执行单元 |
| Passport | 节点的身份凭证 |
| Capability | 节点具备的技能/服务能力 |
| Asset | 节点持有的资源 |
| Reputation | 基于历史的信誉评分 |

### 10.2 参考资料

- OCAX 白皮书 (规划中)
- 协议层: Order Schema v0.1
- 节点能力卡片: Node Capability Card v0.1

---

*文档版本: v0.1*
*创建时间: 2026-03-15*
*作者: Jiahui*
