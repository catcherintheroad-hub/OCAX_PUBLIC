# OCAX Workflow Proposal: pdf_merge

**Candidate for Third Real Workflow**  
**Status**: Proposal (Not Yet Implemented)  
**Last Updated**: 2026-03-17

---

## Executive Summary

This document proposes **pdf_merge** as the third real workflow for OCAX.

> This is a **candidate proposal**, not a confirmed capability.

---

## Why pdf_merge fits current OCAX stage

当前阶段，OCAX 优先选择 **pdf_merge** 而非复杂 agent workflow，原因如下：

### 1. 验收可量化
- 输入：多个 PDF 文件
- 输出：合并后的 1 个 PDF
- 验证：文件数量、页数、格式 → **完全可结构化校验**

### 2. 执行确定性高
- 不涉及 AI 推理
- 不涉及模型调用
- 结果可精确复现

### 3. 复用现有 Validator 能力
- 复用文件存在性验证
- 复用文件属性验证
- 复用格式校验

### 4. 用户需求真实
- 日常办公常见需求
- 可对接现有文档处理流程
- 适合作为 OCAX 的第一个「实用型」workflow

---

## Input / Output Definition

### Input

```json
{
  "workflow_id": "OCAX-WF-pdf-merge-001",
  "input_payload": {
    "action": "pdf_merge",
    "input_files": [
      "doc1.pdf",
      "doc2.pdf",
      "doc3.pdf"
    ],
    "output_filename": "merged.pdf",
    "sort_order": "original"
  },
  "required_node_tags": ["document_processing"]
}
```

### Output

```json
{
  "output_file": "merged.pdf",
  "file_size_bytes": 1048576,
  "format": "PDF",
  "page_count": 15,
  "merged_from": ["doc1.pdf", "doc2.pdf", "doc3.pdf"],
  "input_page_counts": [5, 7, 3]
}
```

---

## Real execution characteristics

### 执行方式
- 使用 Python PyPDF2 或 pypdf 库
- 纯本地文件操作
- 无网络调用
- 执行时间可预估

### 性能预期
- 3 个 PDF 合并: < 2 秒
- 10 个 PDF 合并: < 5 秒

---

## Acceptance rules draft

验收规则草稿：

| # | 规则 | 预期 | 备注 |
|---|------|------|------|
| 1 | input_files_count_valid | PASS/FAIL | 输入文件数量 2-20 |
| 2 | input_files_exist | PASS/FAIL | 每个输入文件都存在 |
| 3 | output_file_generated | PASS/FAIL | 输出文件成功生成 |
| 4 | output_format_pdf | PASS/FAIL | 输出格式为 PDF |
| 5 | output_pages >= max_input_pages | PASS/FAIL | 输出页数 >= 最大输入页数 |
| 6 | output_file_not_empty | PASS/FAIL | 输出文件大小 > 0 |
| 7 | all_input_files_merged | PASS/FAIL | 每个输入文件都被合并 |

---

## Scoring Logic

### 评分体系 (百分制)

采用 **百分制** 评分体系，统一标准，避免混淆：

| 项目 | 说明 |
|------|------|
| **每项满分** | 100 分 |
| **检查项数** | 7 项 |
| **总分** | 700 分 |
| **折算** | 实际得分 ÷ 700 × 100 |
| **通过线** | ≥ 80 分 (折算后) |

### 计分规则

| 场景 | 得分 |
|------|------|
| 检查项 PASS | 100 分 |
| 检查项 FAIL | 0 分 |

### 通过标准

| 折算后得分 | 判定 |
|------------|------|
| **≥ 80 分** | **PASS** → 可结算 |
| 60-79 分 | MANUAL_REVIEW → 人工复核 |
| **< 60 分** | **FAIL** → 不结算 |

### 为什么 80 分是合理标准

- 7 项检查全部通过 = 700 ÷ 700 × 100 = **100 分** = PASS
- 6 项通过，1 项失败 = 600 ÷ 700 × 100 = **85.7 分** = PASS
- 5 项通过，2 项失败 = 500 ÷ 700 × 100 = **71.4 分** = MANUAL

**80 分线确保**：只要节点认真执行，基本可通过；但有明确失败项时，不会被误判为通过。

---

## Why this workflow is easy to validate

### 1. 客观结果导向
- 不依赖主观判断
- 页数是客观数字
- 文件存在是客观事实

### 2. 边界清晰
- 合并 = 所有输入页都在输出中
- 失败 = 任何一页缺失
- 不存在「差不多」「大概对」

### 3. 可自动化
- 无需人工介入
- 100% 结构化校验
- 结果可直接写入 Passport

### 4. 争议为零
- 节点执行了 → 验收通过
- 没执行 → 验收失败
- 不存在「我觉得不对」

---

## Settlement suitability

### 积分计算

| 项目 | 值 |
|------|-----|
| **Base CR** | 40 CR |
| **满分 Bonus (30%)** | 12 CR |
| **Total** | **52 CR** |

### TP 计算

| 项目 | TP |
|------|-----|
| 验收通过 | +5 |
| 满分 (100分) | +10 |

---

## Reusability for Validator

pdf_merge 可复用的 Validator 能力：

| Validator 能力 | 复用程度 |
|---------------|---------|
| 文件存在性验证 | ✅ 完全复用 |
| 文件格式验证 | ✅ 完全复用 |
| 文件属性验证 | ✅ 部分复用 (新增 page_count) |
| 规则命中判断 | ✅ 完全复用 |

**结论**: Validator 无需大改，只需新增少数检查项。

---

## Demo value

### 对外展示价值

1. **实用型 demo** - 不是 demo 用的 toy task，是真实可用的文档处理
2. **可扩展** - 可后续扩展 pdf_split, pdf_compress, pdf_ocr 等
3. **教育价值** - 清晰展示「执行 → 验收 → 结算」全流程

### 传播口径

> OCAX 不只做图片处理。文档合并，也能自动验收、自动结算。

---

## Why this is better than a complex workflow now

### 复杂 workflow 的问题

| 问题 | 说明 |
|------|------|
| 验收困难 | AI 推理结果难以结构化验证 |
| 边界模糊 | 什么是「正确答案」难以定义 |
| 争议率高 | 用户可能不接受 AI 判定 |
| Validator 难复用 | 每种 AI 任务需要不同验收逻辑 |

### 为什么 pdf_merge 是更好的选择

1. **确定性** - 合并结果可精确验证
2. **可量化** - 页数、文件数完全可数
3. **无争议** - 不存在"我觉得不对"
4. **可复用** - Validator 能力可跨 workflow 复用

---

## Suggested Implementation

### Base CR: 40 CR

### TP Gain Logic

| 场景 | TP |
|------|-----|
| 验收通过 | +5 |
| 满分 (100分) | +10 |
| 连续 3 次 | +15 |

---

## Risks / Limitations

| 风险 | 级别 | 缓解措施 |
|------|------|---------|
| 大文件处理超时 | 中 | 设置 timeout 限制 (30s) |
| 加密 PDF 无法处理 | 低 | 验收时检测并标记 |
| 中文文件名编码 | 低 | UTF-8 标准化 |
| 多用户并发 | 中 | 后续扩展队列机制 |

---

## Recommendation

| 项目 | 建议 |
|------|------|
| **是否立项** | ✅ 建议立项 |
| **优先级** | 中 (在 image 类之后) |
| **预计实现难度** | 低 (1-2 天) |
| **预期验收通过率** | 高 (>95%) |

---

## Next Steps

1. 实现 pdf_merge 执行脚本
2. 配置 Acceptance Rules (7 项检查)
3. 接入 Validator
4. 测试真实闭环
5. 上线

---

*Proposal Version: 1.1 | 2026-03-17*
