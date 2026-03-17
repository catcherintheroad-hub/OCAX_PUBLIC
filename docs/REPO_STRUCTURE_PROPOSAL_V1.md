# OCAX Repository Structure Proposal v1

**Version**: 1.0  
**Purpose**: Repository Structure Recommendation  
**Last Updated**: 2026-03-17

---

## 推荐目录树

```
OCAX/
├── README.md                 # 仓库首页
├── LICENSE                  # 许可证
├── .gitignore
│
├── docs/                    # 文档目录
│   ├── index.md            # 文档索引
│   │
│   ├── core/               # 核心概念 (对外展示)
│   │   ├── OCAX_STATUS_OVERVIEW_V1.md
│   │   ├── OCAX_VALIDATOR_V1.md
│   │   └── OCAX_PASSPORT_SKILL_V2.md
│   │
│   ├── workflows/          # Workflow 定义
│   │   ├── OCAX_WORKFLOW_PDF_MERGE_PROPOSAL_V1.md
│   │   └── *.md
│   │
│   ├── messaging/          # 对外传播
│   │   ├── OCAX_LAUNCH_POST_V1.md
│   │   ├── OCAX_MESSAGING_PACK_V1.md
│   │   └── OCAX_SKILL_MARKET_FINAL_V1.md
│   │
│   └── internal/           # 内部协议 (可选整理)
│       ├── Acceptance_Rules_*.md
│       ├── Settlement_Rules_*.md
│       └── Passport_Schema_*.md
│
├── schemas/                 # 协议 Schema
│   ├── node-schema.json
│   ├── passport-schema.json
│   ├── order-schema.json
│   └── workflow-schema.json
│
├── workflows/              # Workflow 代码
│   ├── image_resize/
│   ├── image_format_convert/
│   └── pdf_merge/
│
├── samples/                 # 示例代码
│   ├── node-sample/
│   └── validator-sample/
│
├── active_nodes/           # 活跃节点脚本
│   ├── generate_node.py
│   └── run_demo.py
│
└── assets/                 # 静态资源
    └── images/
```

---

## README 适合链接哪些内容

| 内容 | 位置 | 原因 |
|------|------|------|
| 项目状态 | docs/core/ | 一眼看到进展 |
| 核心概念 | docs/core/ | 了解 OCAX 是什么 |
| 快速开始 | README.md | 立即上手 |
| Docs 导航 | docs/index.md | 完整文档入口 |

---

## 文档分类

### 对外展示 (External)

适合公开仓库首页链接：
- OCAX_STATUS_OVERVIEW_V1.md
- OCAX_VALIDATOR_V1.md
- OCAX_PASSPORT_SKILL_V2.md
- OCAX_LAUNCH_POST_V1.md

### 内部定义 (Internal)

协议/Schema 类，可能不适合过度公开：
- Acceptance_Rules_*.md
- Settlement_Rules_*.md
- Passport_Schema_*.md

---

## 当前 docs 最建议优先整理的 5 个文件

| # | 文件 | 理由 |
|---|------|------|
| 1 | OCAX_STATUS_OVERVIEW_V1.md | 项目总览，第一眼 |
| 2 | OCAX_VALIDATOR_V1.md | 核心组件定义 |
| 3 | OCAX_PASSPORT_SKILL_V2.md | 核心组件定义 |
| 4 | OCAX_LAUNCH_POST_V1.md | 对外首发 |
| 5 | DOCS_INDEX_V1.md | 文档导航 |

---

*OCAX Repository Structure Proposal v1.0*
