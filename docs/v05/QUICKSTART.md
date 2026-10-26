> **历史文档（v0.5 早期）**：beta.12 已取消本地 Owner，账号只由中心管理；当前流程以 `../LOGIN.md` 为准。

# TAA Node v0.5 · 快速开始

## 前提

- Python 3.10+
- `curl`、`tar`
- 能访问公测中心 `https://alice.loomsci.com`

运行环境由用户自行准备；本包不包含 Python 运行时。

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh --center https://alice.loomsci.com
```

安装器会：

```text
创建本地 .venv
安装 Flask / cryptography
生成本地 Owner / Node / Agent 身份
打印 CLAIM_URL
```

看到 `CLAIM_URL=...` 后，在浏览器打开，登录已有 Owner 或注册 Owner，确认这台电脑。

## 启动本地 UI

```bash
~/.taa-v05/app/taa open
```

打开 <http://127.0.0.1:6099/app>。

## 验证

```bash
~/.taa-v05/app/taa status
```

确认：

```text
node_status = active
center.owner_id 非空
agents 非空
```

## 第二台电脑

在第二台电脑重复安装，浏览器登录**同一个 Owner**，不要创建第二个 Owner，也不要复制第一台的 key。
