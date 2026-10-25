# TAA Node v0.5.0 · 公测

- 版本：`0.5.0`
- 源码提交：`2a5834b`
- 公测中心：`https://dev.alice.loomsci.com`
- 包大小：约 24 KB（不含 Python 运行时）
- 运行环境：Python 3.10+、`curl`、`tar`；由用户自行准备
- 默认工具：`weather`、`research.ask`

## 本版内容

- Owner → Node → Agent 身份
- 本地 Flask UI
- 中心 claim
- 第二台电脑加入同一 Owner
- X25519 + AES-GCM 加密消息
- bundle export / import / sync
- 一键安装：自动 init；提供 `--center` 时自动 claim
- `--no-browser` 下打印 `CLAIM_URL`
- 公开包不含 key / identity / 私有数据

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh --center https://dev.alice.loomsci.com
```

## 已知限制

- 运行环境由用户自行准备；安装器会创建 `.venv` 并安装 Flask/cryptography。
- 公测中心是 `dev` 环境，不是生产中心。
- Windows 安装器尚未验证。
- 不包含中心服务、生产 D1、私有工具或私有数据。

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
