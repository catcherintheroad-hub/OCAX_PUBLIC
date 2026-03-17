# OCAX Publish Workflow v1

**Version**: 1.0  
**Purpose**: Semi-automated Publishing Workflow  
**Last Updated**: 2026-03-17

---

## 工作流概述

本工作流实现"半自动"发布：
1. 内容从源文件自动提取
2. 发布前检查确保一致性
3. 输出到固定 release 目录
4. 手动确认后一键发布

---

## 内容源

| 源文件 | 用途 |
|--------|------|
| D:\OCAX\README.md | GitHub 首页 |
| D:\OCAX\docs\OCAX_FINAL_PUBLISH_PACK_V1.md | 发布包 |
| D:\OCAX\docs\OCAX_SKILL_MARKET_FINAL_V1.md | Skill 页面 |
| D:\OCAX\docs\OCAX_LAUNCH_POST_V1.md | 首发帖 |

---

## 输出目录

```
D:\OCAX\release\
├── github\
│   ├── README_READY.md
│   └── RELEASE_SUMMARY.md
├── skill\
│   └── SKILL_READY.md
└── posts\
    ├── LAUNCH_SHORT.txt
    └── LAUNCH_STANDARD.txt
```

---

## Telegram 控制指令

| 指令 | 动作 |
|------|------|
| `/ocax_publish github` | 生成 GitHub 发布内容 |
| `/ocax_publish skill` | 生成 Skill 市场内容 |
| `/ocax_publish post_short` | 生成短帖 (120字) |
| `/ocax_publish post_long` | 生成标准长帖 (300字) |
| `/ocax_publish pack` | 生成完整发布包 |
| `/ocax_check` | 运行发布前检查 |

---

## 发布前检查项

每次发布前自动检查：

| 检查项 | 标准 |
|--------|------|
| 主定位 | 必须包含 "面向 AI agent 的可验证执行网络" |
| 副定位 | 必须包含 "可验证、可成长、可积分结算" |
| Core Logic | 必须包含 "Node executes → Validator verifies → Settlement releases CR → Passport records growth" |
| 夸大检查 | 不能包含 "去中心化市场"、"全网节点"、"真钱交易" |
| TP 增量 | 不能包含具体数值，必须是 "按当前规则" |

---

## 文件命名规范

| 输出 | 命名 |
|------|------|
| GitHub README | README_READY.md |
| Release 说明 | RELEASE_SUMMARY.md |
| Skill 内容 | SKILL_READY.md |
| 短帖 | LAUNCH_SHORT.txt |
| 长帖 | LAUNCH_STANDARD.txt |

---

## 推荐下一步实现方式

### Option A: PowerShell 脚本 + Cron

```powershell
# ocax_publish.ps1
param([string]$target)

# 1. 读取源文件
$readme = Get-Content "D:\OCAX\README.md" -Raw
$pack = Get-Content "D:\OCAX\docs\OCAX_FINAL_PUBLISH_PACK_V1.md" -Raw

# 2. 一致性检查
if ($readme -notmatch "可验证执行网络") {
    Write-Error "主定位不一致"
    exit 1
}

# 3. 输出到 release 目录
switch ($target) {
    "github" { ... }
    "skill" { ... }
    "pack" { ... }
}
```

### Option B: OpenClaw Hook + Exec

1. 创建 OpenClaw hook 监听 `/ocax_publish` 指令
2. Hook 调用本地 PowerShell 脚本
3. 脚本读取源文件 → 检查 → 输出到 release 目录

### Option C: Sub-agent 自动化

1. Telegram 指令触发 sub-agent
2. Sub-agent 读取源文件
3. 执行一致性检查
4. 输出到 release 目录
5. 返回文件路径供手动确认

---

## 工作流状态

| 组件 | 状态 |
|------|------|
| 文档定义 | ✅ 完成 |
| 目录结构 | ✅ 定义 |
| 指令方案 | ✅ 设计 |
| 自动脚本 | 🔶 待实现 |

---

## 下一步

1. 实现 PowerShell 脚本 (ocax_publish.ps1)
2. 配置 Telegram 指令监听
3. 测试完整流程

---

*OCAX Publish Workflow v1.0*
