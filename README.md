# TAA Node v0.5 · 公测

TAA 是装在一台电脑上的本地 Agent 宿主与对等协作节点。

```text
Owner → Node → Agent
本地 Flask UI
中心 claim
第二台电脑加入同一 Owner
端到端加密消息
bundle export / import / sync
```

公开包**不需要 agent key**，也不需要登录后复制 key。安装器自动创建本地身份；提供 `--center` 时自动进入浏览器 claim。

- 当前版本：`0.5.1`
- 公测中心：`https://alice.loomsci.com`
- 本地 UI：`http://127.0.0.1:6099/app`
- 运行环境：Python 3.10+、`curl`；运行环境由用户自行准备

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh
```

安装器会打印：

```text
AUTO_INIT=YES
AUTO_CLAIM=YES
CLAIM_URL=...
```

在浏览器打开 `CLAIM_URL`，登录已有 Owner 或创建 Owner，确认这台电脑。不要创建第二个 Owner 来加入同一账号。claim 成功后安装器会自动启动本地 UI 并打开浏览器；如果浏览器没有打开，运行：

```bash
~/.taa-v05/app/taa open
```

也可以先下载包再安装：

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-node-v05-0.5.1.tar.gz -o /tmp/taa-v05.tgz
mkdir -p /tmp/taa-v05 "$HOME/.taa-v05/app"
tar xzf /tmp/taa-v05.tgz -C /tmp/taa-v05
cp -R /tmp/taa-v05/taa-node-v05/. "$HOME/.taa-v05/app/"
"$HOME/.taa-v05/app/install.sh" --center https://alice.loomsci.com
```

## IDE 入口

把 [`PROMPT.md`](PROMPT.md) 整段粘贴到 IDE 的 Agent/终端对话里。提示词会下载公开包、校验 SHA256、自动 init/claim，并把 `CLAIM_URL` 交给用户完成登录。

## 启动本地 UI

安装/claim 成功后会自动启动并打开。需要手动控制时：

```bash
~/.taa-v05/app/taa open     # 启动并打开
~/.taa-v05/app/taa status   # 查看状态
~/.taa-v05/app/taa stop     # 停止
```

固定入口：<http://127.0.0.1:6099/app>。

中心 Owner 目录页会显示“本机 TAA”：

- 本地 Flask 最近在线：显示直达按钮，可用 `?open=1` 自动跳转
- 未检测到：显示可粘贴到 opencode / IDE 的启动提示词

## 默认工具

- `weather`
- `research.ask`

## 版本与校验

```text
TAA Node 0.5.1
```

```bash
shasum -a 256 -c SHA256SUMS
```

## 文档

- [公测快速开始](docs/v05/QUICKSTART.md)
- [安装](docs/v05/INSTALL.md)
- [IDE 提示词](docs/v05/IDE_PROMPT.md)
- [中心 claim 与 Owner](docs/v05/CENTER_CLAIM.md)
- [旧版 TAA Complete 0.4.1](docs/LEGACY_0.4.1.md)

## 不包含

- 中心服务、生产 D1、生产 key
- 私有工具与私有数据
- 个人 presets / wardrobe
- 任何真实密钥、密码、证书

## 旧版

`releases/taa-complete-0.4.1.tar.gz` 保留用于旧版兼容；新用户不要从旧版开始。
