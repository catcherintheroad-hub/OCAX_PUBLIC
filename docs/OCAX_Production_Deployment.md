# OCAX 生产环境部署配置

## 1. 服务器配置

### 推荐配置
- **云平台**: AWS / GCP / 阿里云
- **实例类型**: 
  - Web/API: t3.large (2CPU, 8GB)
  - Worker: c5.2xlarge (8CPU, 16GB)
  - Database: db.r5.large
  - Cache: cache.r5.large

### 网络架构
```
[Load Balancer]
    ↓
[API Servers] × 3
    ↓
[Workers] × 5
    ↓
[Redis] + [PostgreSQL]
```

## 2. CI/CD 配置

### GitHub Actions
```yaml
# .github/workflows/deploy.yml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run Tests
        run: pytest
      
  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to Production
        run: |
          # 部署命令
```

### 自动化测试
- 单元测试: pytest
- 集成测试: test_platform_integration.py
- 负载测试: test_load.py

## 3. 监控配置

### Prometheus + Grafana
```yaml
# docker-compose.monitoring.yml
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
  
  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
```

### 监控指标
- API 响应时间
- 任务处理延迟
- 节点负载
- 支付成功率

### 日志系统 (ELK)
```
[App Logs] → [Filebeat] → [Logstash] → [Elasticsearch] → [Kibana]
```

## 4. 支付网关配置

### 环境变量
```bash
# 生产环境
export STRIPE_API_KEY=sk_live_xxx
export STRIPE_WEBHOOK_SECRET=whsec_xxx
export CRYPTO_RPC_URL=https://mainnet.infura.io/v3/xxx
export CRYPTO_PRIVATE_KEY=xxx

# 测试环境
export STRIPE_API_KEY=sk_test_xxx
```

### 支付网关支持
| 网关 | 状态 | 配置 |
|------|------|------|
| Stripe | 需要API Key | sk_live_xxx |
| PayPal | 需要API Key | - |
| Crypto | 需要RPC | infura/alchemy |
| 支付宝 | 需要商家号 | - |
| 微信 | 需要商户号 | - |

## 5. 部署检查清单

- [ ] 服务器初始化
- [ ] 域名配置
- [ ] SSL证书
- [ ] 数据库迁移
- [ ] Redis配置
- [ ] 环境变量
- [ ] 支付网关API
- [ ] 监控告警
- [ ] 日志收集
- [ ] 备份策略

## 6. 快速启动

```bash
# 1. 克隆项目
git clone https://github.com/HKUDS/OCAX.git

# 2. 配置环境
cp .env.example .env
# 编辑 .env 填入API密钥

# 3. 启动服务
docker-compose up -d

# 4. 运行测试
pytest tests/

# 5. 部署
./deploy.sh production
```

---

*Created: 2026-03-15*
