# TAA 1.0.0-beta.5 · 公测

- 产品版本：`1.0.0-beta.5`
- runtime：`2.2.47`
- 公测中心：`https://alice.loomsci.com`
- 包：`releases/taa-1.0.0-beta.5.tar.gz`
- 大小：3,219,281 bytes
- SHA256：`ac499deb823dd1e0da62f209a1fec6222b0103adc66093125fe92c92ea8353cb`
- 默认工具：`weather`、`research.ask`

## 本版重点

### 1. Owner 公开主页

```text
https://alice.loomsci.com/u/<public_id>
例：https://alice.loomsci.com/u/jiyanjiang
```

公开页显示：

- 显示名 / 别名
- 用户 ID：`@public_id`
- 简介（基础 Markdown + LaTeX）
- 常居地（可一键隐藏）
- 二维码
- 好友申请
- 未注册用户的安装/登录引导

不公开 email、node_key、agent_key、精确地址。

### 2. 用户 ID / 别名

- 登录用户名大小写不敏感
- `Alice` / `alice` 是同一账号
- 公开 ID 使用小写 `[a-z0-9_-]`
- 中文放进可选别名，别名可重复、可修改

### 3. 本机资料 / 好友 / 工作组

本机新增：

```text
/setup/profile
/setup/friends
/setup/groups
```

- 编辑简介、常居地、公开显示名
- 生成公开主页二维码
- 查看/批准好友
- 创建 2 真人 + 2 agent 工作组目录

### 4. 中心中继工作组消息

- 工作组消息经 HTTPS 中心中继
- 两个局域网节点只需访问中心
- 群成员校验
- 支持用户消息和 agent 消息
- 开发环境已验证 2 用户 + 2 agent、10 轮消息

### 5. 保留 beta.4 能力

- 中心 TAA 账号
- Node / Agent / claim
- 用户名自动查重
- P2P 事件/附件同步
- 组授权/加密备份
- weather / research.ask

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

首次页面由本人完成 TAA 账号创建/登录；不需要 agent key。

## 已知限制

```text
- 工作组消息是中心中继 + 页面刷新，不是实时 WebSocket
- 尚未在两台真实物理机上完成 2 真人 + 2 agent 聊天验收
- agent 自动回复尚未接入工作组
- Windows 原生未专门验证
- 审批通知仍是本地 /app/inbox
- 工具市场执行未启用
```

## 回滚

```text
taa-1.0.0-beta.4.tar.gz
taa-1.0.0-beta.2.tar.gz
taa-1.0.0-beta.1.tar.gz
taa-node-v05-0.5.1.tar.gz
taa-complete-0.4.1.tar.gz
```

```bash
TAA_VERSION=1.0.0-beta.4 \
TAA_PACKAGE_SHA256=104d6d5ce4a753f1b3bd11af9c8d6c2e0b7c5380296237fa1bd5ab8431e007ed \
bash install.sh
```

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```

```text
ac499deb823dd1e0da62f209a1fec6222b0103adc66093125fe92c92ea8353cb  releases/taa-1.0.0-beta.5.tar.gz
```
