# OCAX Demo Runbook - 可重复执行演示清单

**目的**: 快速跑通 OCAX 最小交易闭环  
**预计时间**: 2-3 分钟

---

## 1. 演示前准备

### 1.1 环境检查
```bash
# 确保 OCAX 项目存在
Test-Path D:\OCAX\src\ocax_passport.py

# 确保 Python 环境
python --version
```

### 1.2 依赖检查
```bash
pip install psutil openpyxl
```

---

## 2. 演示步骤

### Step 1: 激活节点 (如未激活)
```bash
python D:\OCAX\active_nodes\generate_node.py
```

**预期输出**:
```
Node ID: OCAX-NODE-20260317-xxxxxxxx
Passport ID: OCAX-PASSPORT-20260317-xxxxxxxx
Status: active
```

### Step 2: 运行交易闭环
```bash
python D:\OCAX\active_nodes\run_demo.py
```

**预期输出**:
```
[STEP 1] CREATE ORDER
Order ID: OCAX-ORDER-20260317-xxxxxxxx

[STEP 2] MATCH NODE
Matched Node: OCAX-NODE-20260317-xxxxxxxx

[STEP 3] EXECUTE TASK
Task executed successfully

[STEP 4] VALIDATE
Status: AUTO_REVIEW_PASSED
Score: 95.0

[STEP 5] SETTLE
Order Price: $5.00
Settlement: $4.75

TRANSACTION COMPLETE
```

---

## 3. 预期结果

| 阶段 | 状态文件字段 | 预期值 |
|------|-------------|--------|
| Order | status | pending → settled |
| Match | assigned_node_id | OCAX-NODE-xxx |
| Execute | output_payload.file | output_xxx.png |
| Validate | acceptance_score | 95.0 |
| Settle | settlement_amount | 4.75 |

---

## 4. 验证命令

### 4.1 检查订单
```powershell
Get-Content D:\OCAX\active_nodes\OCAX-ORDER-20260317-*.json | ConvertFrom-Json
```

### 4.2 检查节点
```powershell
Get-Content D:\OCAX\active_nodes\OCAX-NODE-20260317-*.json | ConvertFrom-Json
```

---

## 5. 常见问题

### Q1: 节点匹配失败
**原因**: 节点 whitelist_status 不是 approved  
**解决**: 检查节点文件中的 whitelist_status 字段

### Q2: 验收失败
**原因**: 模拟规则太严格  
**解决**: 调整 acceptance_score 计算逻辑

### Q3: 金额显示异常
**原因**: 浮点数格式化问题  
**解决**: 使用 `f"${amount:.2f}"` 格式化

---

## 6. 故障排查

| 症状 | 排查步骤 |
|------|---------|
| 无订单文件 | 检查 `D:\OCAX\active_nodes\` 目录 |
| 节点不存在 | 重新运行 `generate_node.py` |
| 金额为 0 | 检查 settlement 计算逻辑 |
| 状态卡住 | 检查 JSON 文件完整性 |

---

## 7. 演示脚本清单

| 脚本 | 用途 |
|------|------|
| `generate_node.py` | 生成节点 Passport |
| `run_demo.py` | 运行完整闭环 |

---

*Runbook 版本: 1.0 | 更新: 2026-03-17*
