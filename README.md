# TAA 1.0.0-beta.1 · 公测

TAA 是装在一台电脑上的本地 Agent 宿主与对等协作节点。

```text
Core + Runtime
Owner / Node / Agent
本地 /app：首页 / 会话 / 频道 / 帖子 / 看板 / 团队 / 工具 / 设置
中心 claim、目录、信箱、中继
weather + research.ask
同机 / 同 LAN / 跨 LAN
```

## 安装

要求：Python 3.10+、`curl`、`tar`。不需要 agent key。

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

安装器会：

```text
复制运行时到 ~/.taa/app
创建 ~/.taa/venv
安装 Flask / PyYAML / cryptography / Pillow / Markdown
启动本地 Flask（6080）
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

首次进入 `/setup/` 创建/认领 Owner；不要复制 key，不要创建第二个 Owner。

## 本地控制

```bash
~/.taa/app/taa open
~/.taa/app/taa status
~/.taa/app/taa stop
```

## 默认工具

```text
weather
research.ask
```

不包含 Physics World / APS / sources / 工具市场执行。

## 版本

```text
产品：TAA 1.0.0-beta.1
runtime：2.2.47
protocol：node-v0.5 / center-v0.5
schema：1
```

包：`releases/taa-1.0.0-beta.1.tar.gz`  
校验：`SHA256SUMS`

## 文档

- [完整使用说明](GUIDE.md)
- [版本与包边界](VERSIONS.md)
- [IDE 提示词](PROMPT.md)
- [旧版 0.4.1](docs/LEGACY_0.4.1.md)
