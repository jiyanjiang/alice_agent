# TAA 1.0.0-beta.6 · 公测

- 产品版本：`1.0.0-beta.6`
- runtime：`2.2.47`
- 公测中心：`https://alice.loomsci.com`
- 包：`releases/taa-1.0.0-beta.6.tar.gz`
- 大小：3,222,905 bytes
- SHA256：`187abad06cd9488f0545960c49356a5d9e4d3d0419b76f7813e93ee132566e27`

## 本版重点：升级不再覆盖数据

beta.6 新增正式升级路径：

```text
已有安装 → 检测 identity.json
→ 停止服务
→ 备份 identity / agents / data.db / events.db / config / uploads
→ staging app.new
→ 迁移 events.db 到 ~/.taa/events.db
→ 原子切换 app
→ 健康检查
→ 失败自动回滚
```

新安装仍从 0 开始；已有安装走升级。

### 保护清单

```text
identity.json
agents/
bootstrap/
data.db (+ WAL)
events.db
config.toml
static/uploads/
backups/
app/data/
```

### 原子升级

```text
完整包
→ app.new
→ app.prev
→ 原子替换
```

不是直接覆盖 live app。

### 自动回滚

```text
迁移失败 / 切换失败 / 健康检查失败
→ 停止新版本
→ 恢复 app.prev
→ 恢复 data.db / events.db 备份
→ 启动旧版本
→ 验证旧版本健康
```

已实测：

```text
beta.5 → beta.6 成功
身份/Agent key/配置/附件保持不变
data 表 sentinel 保留
events.db 4 条事件保留
app/data 旧日志保留
强制健康失败 → 自动回滚到 beta.5
```

### events.db

`events.db` 是事件溯源日志，不是缓存：

```text
events / lamport / node_id / type / payload
meta / 同步游标
```

beta.6 起默认位置：

```text
~/.taa/events.db
```

旧位置的 `app/events.db` 会在升级时迁移并保留备份。

## 保留能力

```text
公开主页 /u/<public_id>
简介 / Markdown / LaTeX
常居地 / 隐藏 / 二维码
好友申请 / 批准
2 真人 + 2 agent 工作组目录
中心中继工作组消息
TAA 账号 / Node / Agent
P2P / 组授权 / 加密备份
```

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

已有 beta.5 安装直接运行同一命令，会进入升级流程。

## 已知限制

```text
升级器在 macOS 实测；Windows 原生未验证
未做断电级故障注入（已做健康检查失败回滚）
工作组消息是中心中继 + 页面刷新
真实两物理机 2 真人 + 2 agent 聊天待验收
```

## 回滚

```text
taa-1.0.0-beta.5.tar.gz
taa-1.0.0-beta.4.tar.gz
taa-1.0.0-beta.2.tar.gz
taa-1.0.0-beta.1.tar.gz
```

```bash
TAA_VERSION=1.0.0-beta.5 \
TAA_PACKAGE_SHA256=ac499deb823dd1e0da62f209a1fec6222b0103adc66093125fe92c92ea8353cb \
bash install.sh
```

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
