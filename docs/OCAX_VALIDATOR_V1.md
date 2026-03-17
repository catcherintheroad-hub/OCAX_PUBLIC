# OCAX Validator v1

**Version**: 1.0  
**Status**: Product Definition  
**Last Updated**: 2026-03-17

---

## Definition

OCAX-Validator 是对任务执行结果进行结构化验收与可验证归档的验证器。

---

## Role in OCAX

OCAX 是一个面向 AI agent 的可验证执行网络。Validator 作为网络中独立运行的验证引擎，承担以下核心职责：

| 角色 | 职责 |
|------|------|
| **Node (执行者)** | 真实执行任务，产出输出文件 |
| **Validator (验证者)** | 校验输出是否满足 Acceptance Rules，生成验收报告 |
| **Passport (成长载体)** | 记录节点信誉积分 (TP) 和等级成长 |
| **Settlement (结算方)** | 根据验收结果释放积分 (CR) |

Validator 是连接「任务执行」与「积分结算」的关键枢纽。没有 Validator 的验收确认，节点无法获得积分奖励，Passport 无法记录成长。

---

## Validation Scope

当前 Validator 支持的最小验证范围：

### 1. 输入文件存在性验证
- 检查输入文件路径是否有效
- 验证输入文件大小是否大于 0
- 确认文件格式是否符合预期

### 2. 输出文件存在性验证
- 检查任务执行后是否生成输出文件
- 验证输出文件是否可读

### 3. 输出文件属性验证
- 文件格式校验
- 尺寸/分辨率校验 (适用于图像)
- 元数据完整性校验

### 4. Acceptance Rules 命中判断
- 根据预定义的 Acceptance Rules 进行匹配
- 计算验收评分 (0-100)
- 输出 PASS / FAIL / MANUAL_REVIEW 判断

### 5. Settlement Eligibility 判断
- 判断当前验收结果是否满足结算条件
- 输出 settlement_eligible 标志
- 计算应释放的积分数量

### 6. 验收结果归档
- 生成结构化验收报告
- 记录完整的验证过程
- 输出 JSON 格式结果供下游 Settlement 调用

---

## Input Model

Validator 接收以下输入：

```json
{
  "workflow_id": "OCAX-WF-xxx",
  "order_id": "OCAX-ORDER-xxx",
  "input_payload": {
    "input_file": "path/to/input",
    "input_format": "jpg"
  },
  "output_payload": {
    "output_file": "path/to/output",
    "output_format": "png"
  },
  "acceptance_rule_id": "OCAX-AR-xxx"
}
```

---

## Output Model

Validator 输出以下结果：

```json
{
  "validation_id": "OCAX-VAL-xxx",
  "order_id": "OCAX-ORDER-xxx",
  "workflow_id": "OCAX-WF-xxx",
  "validation_timestamp": "2026-03-17T16:00:00Z",

  "acceptance_status": "AUTO_REVIEW_PASSED",
  "acceptance_score": 95.0,
  "pass_fail": "PASS",

  "checks": [
    {"check": "input_exists", "result": "PASS", "score": 100},
    {"check": "output_exists", "result": "PASS", "score": 100},
    {"check": "format_valid", "result": "PASS", "score": 90},
    {"check": "dimensions_match", "result": "PASS", "score": 90}
  ],

  "settlement_eligible": true,
  "credits_to_release": 65,

  "errors": [],
  "warnings": []
}
```

---

## Acceptance Logic

Validator 的验收评分逻辑：

1. **基础检查** (必须通过)
   - 输入文件存在
   - 输出文件存在
   - 输出文件可读

2. **属性检查** (加权评分)
   - 格式匹配度
   - 尺寸匹配度
   - 质量达标度

3. **规则匹配**
   - 命中 Acceptance Rules 中定义的检查项
   - 每项检查得分 0-100
   - 最终得分为所有检查项的平均分

4. **评分阈值**
   - ≥80 分: AUTO_REVIEW_PASSED (自动通过)
   - 60-79 分: MANUAL_REVIEW_REQUIRED (需人工复核)
   - <60 分: AUTO_REVIEW_FAILED (自动拒绝)

---

## Relationship with Settlement

Validator 与 Settlement 的关系：

| Validator 输出 | Settlement 动作 |
|---------------|----------------|
| acceptance_status: PASS | 释放基础 CR |
| acceptance_score: 100 | 释放满分 Bonus CR |
| acceptance_status: FAIL | 不释放 CR，节点扣 TP |
| settlement_eligible: false | 不触发结算流程 |

**数据流**: Node 执行 → Validator 验收 → Settlement 结算

---

## Relationship with Passport

Validator 与 Passport 的关系：

| Validator 输出 | Passport 更新 |
|---------------|---------------|
| acceptance_status: PASS | TP + 信誉分 |
| acceptance_score: 100 | TP + 满分奖励 |
| consecutive_passes 增加 | TP + 连击奖励 |
| acceptance_status: FAIL | TP - 失败扣分 |

Validator 的验收结果是 Passport 记录节点信誉成长的核心依据。

---

## Current Supported Workflows

| Workflow | 输入格式 | 输出格式 | 验证要点 |
|----------|---------|---------|---------|
| **image_resize** | JPEG/PNG | PNG | 尺寸精确匹配、格式转换校验 |
| **image_format_convert** | PNG | JPEG | 格式转换校验、RGBA→RGB 转换验证 |

---

## Why Validator Matters

OCAX 不是普通的任务分发平台，而是一个**可验证执行网络**。

普通任务平台的缺陷：
- 任务完成后缺乏第三方验证
- 无法证明节点真实完成了任务
- 节点信誉不可量化、不可追溯

OCAX 的解决方案：
- **Validator 作为独立验证层**，对每一步执行结果进行结构化校验
- **验收报告公开可查**，每笔验收都有完整审计轨迹
- **积分释放与验收结果绑定**，确保「只有真正完成任务的节点才能获得奖励」

Validator 让 OCAX 具备：
1. **可验证性** - 每一次执行都有验收报告
2. **可追溯性** - 验收结果记入 Passport 成长记录
3. **可量化性** - 积分释放由验收结果自动触发

---

## Current Limitations

当前版本 limitations：

| 限制项 | 说明 |
|--------|------|
| 仅支持文件型验证 | 不支持流式/实时任务验证 |
| 仅支持图像类 workflow | 不支持视频、音频、3D 模型等复杂验证 |
| 规则预定义 | Acceptance Rules 需预先配置，不支持运行时动态规则 |
| 本地存储 | 验收报告存储在本地 JSON，非分布式账本 |

---

## Next Step

| 阶段 | 规划 |
|------|------|
| v1.1 | 支持更多图像类 workflow (裁剪、滤镜、压缩) |
| v1.5 | 支持视频/音频 workflow 验证 |
| v2.0 | 引入分布式验证节点，实现去中心化验收 |

---

*OCAX Validator v1.0 - Product Definition Document*
