# OCAX

**把 OpenClaw 设备变成一个可调度的执行网络。**

OCAX 是一个面向 OpenClaw 的资源调度、任务执行与 Workflow 价值平台。

它不是简单的任务列表，也不是普通控制台，而是把：
- 节点接入
- 任务调度
- 实时执行可见性
- Workflow 资产化

组合成一个真正可运营的平台体验。

---

## 它是做什么的
OCAX 把四件事连成一个产品闭环：

### 1. 节点网络
把 OpenClaw 设备接入成可用执行节点。

### 2. 任务分发
按可用性、归属关系、执行上下文，把任务发到合适的节点。

### 3. 实时执行可见性
让用户和运营者看到：
- 什么正在运行
- 什么失败了
- 什么完成了
- 哪些环节需要介入

### 4. Workflow 价值层
把好的 Workflow 包装成可复用、可展示、可调用、可计量的资产。

---

## 为什么它重要
很多 AI / 设备工作流到了 demo 阶段就断了：
- 任务能创建，但不一定真能稳定执行
- 执行发生了，但没人知道现在跑到哪了
- Workflow 存在，但无法很好复用和产品化
- operator 没有真正可用的控制面

OCAX 要解决的正是这个断层。

它把分散的 OpenClaw 能力，变成：
- 一个可用的节点网络
- 一个可见的执行系统
- 一个 operator 友好的控制台
- 一个可持续扩展的 Workflow 价值层

---

## 产品界面
### Execution Console
用于查看执行进度、状态变化和 operator 操作。

### Commerce Console
用于查看购买、credits、结算相关状态与商业化流转。

### Ops Console
用于查看平台健康、执行态势、商业态势和运维提示。

---

## 适合谁
OCAX 适合这些人或团队：
- 想把 OpenClaw 任务跑在多台机器上
- 需要协调分布式执行
- 想把 AI Workflow 做成可复用产品
- 想运营内部或外部 Workflow Marketplace
- 希望让 AI / 设备基础设施真正“可见、可控、可运营”

---

## 产品定位
OCAX **不只是 dashboard**，也 **不只是 task queue**。

它是一个位于以下几层之间的平台层：
- task intent
- node execution
- workflow packaging
- operator visibility
- value capture

---

## 这个 public 仓库的职责
这个仓库主要用于：
- 对外说明产品
- 提供 public-safe 文档
- 展示 demo 资产
- 承载 launch materials
- 解释高层架构和产品语言

它**不会**公开：
- 核心实现细节
- 敏感 runtime 内部逻辑
- 私有运营策略
- 核心竞争力相关代码路径

---

## 当前状态
OCAX 主产品线已经完成，并在仓库 / 构建 / 验证层达到 go-live-ready。

是否进入生产部署，是后续单独执行的动作；本轮不会推到 Railway。

---

## 一句话
**OCAX 让 OpenClaw 变成真正可用的执行平台，而不只是一些分散的设备。**
