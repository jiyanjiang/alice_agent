# TAA 1.0.0-beta.4 · 公测

- 产品版本：`1.0.0-beta.4`
- runtime：`2.2.47`
- 公测中心：`https://alice.loomsci.com`
- 包：`releases/taa-1.0.0-beta.4.tar.gz`
- 大小：3,214,993 bytes（约 3.1 MB）
- SHA256：`104d6d5ce4a753f1b3bd11af9c8d6c2e0b7c5380296237fa1bd5ab8431e007ed`
- 默认工具：`weather`、`research.ask`

## 本版重点

### 1. 单一账号源：中心 TAA 账号

- 中心是唯一 Owner 账号源
- 本机只保存 Node / Agent 身份和中心绑定
- 本机没有 Owner 账号，也没有本地 Owner 密码
- 不再有“本地 Owner”和“中心 Owner”两个账号

### 2. 首次创建/登录取向清楚

- `/setup/` 顶部先选择：
  - `第一次使用`
  - `已有账号`
- 不再同时摆两个模糊按钮
- 创建模式只显示用户名、密码、确认密码
- 登录模式不显示确认密码
- 注册/登录成功后经 `/app/bridge` 进入 `/app`

### 3. 用户名自动查重

- 输入用户名后自动检查
- 显示：
  - `检查用户名…`
  - `可以使用`
  - `已被使用` + `去登录`
- 提交时中心仍会做最终 409 校验
- 并发注册同名时，数据库唯一约束兜底

### 4. 用户名不区分大小写

- `Alice`、`alice`、`ALICE` 是同一个账号
- 显示保留注册时的写法
- 注册、登录、claim 页面统一使用大小写不敏感查询
- D1 迁移：`ux_owners_username_nocase`

### 5. 中心 beta 功能

- `/presence/ws` 在线状态 WebSocket
- Owner card（`/v05/owner/card/...`）
- 现有目录、好友、组授权、加密备份继续保留

## 保留的 beta.2 能力

- 完整 TAA Node：Core + Runtime + `/app` + 默认工具
- TAA 账号 / Node / Agent
- 本地单一入口：`http://127.0.0.1:6080/app`
- 群聊、频道、帖子、看板、团队、工具、设置
- P2P 事件 / 附件同步（签名、增量、重试）
- Owner / 组授权与审批（`/app/peer-grants`）
- 中心组同步（`/app/peer-groups`，beta）
- 备份：明文 ZIP、AES-GCM 加密包、保留轮换（`/app/backup`）
- weather、research.ask

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

首次页面由本人完成 TAA 账号创建/登录；不需要 agent key，不需要第二个 Owner。

## 升级

```text
beta.2 → beta.4：
- 先停止旧进程：~/.taa/app/taa stop
- 重新运行 install.sh
- 旧 Node/Agent 身份保留
- 中心账号用原密码登录；忘记密码用仍绑定的 Node key 重置
- 本机旧 Owner 密码/本地 Owner 概念不再使用
```

## 已知限制

```text
- 不承诺 1000 concurrent
- Windows 原生未专门验证；Linux/macOS 优先
- 真实跨公网/跨局域网双物理机未由发布方代跑
- 中心组同步为 beta
- 审批通知仅本地 /app/inbox；中心通知端点未进入 beta.4
- 自动持续同步/定时备份尚未产品化
- 密钥轮换需手工清理 peer_event_keys
- 工具市场执行未启用
- Physics World / APS / sources 不在本包
```

## 回滚

```text
taa-1.0.0-beta.2.tar.gz
taa-1.0.0-beta.1.tar.gz
taa-node-v05-0.5.1.tar.gz
taa-node-v05-0.5.0.tar.gz
taa-complete-0.4.1.tar.gz
```

回滚：

```bash
TAA_VERSION=1.0.0-beta.2 \
TAA_PACKAGE_SHA256=74157fd4ea492dd4583a53794fd6178d690265a135bc1ac5c97ac2bdc1c455de \
bash install.sh
```

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```

当前包：

```text
104d6d5ce4a753f1b3bd11af9c8d6c2e0b7c5380296237fa1bd5ab8431e007ed  releases/taa-1.0.0-beta.4.tar.gz
```
