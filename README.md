# TAA Complete

TAA 是装在一台电脑上的本地 Agent 宿主与对等协作节点。

- 本地运行：`taa-core` / `http://127.0.0.1:6080`
- 默认工具：`weather` + `research.ask`（调研工作流）
- 不包含：中心服务、私有工具、私有数据、个人衣柜

## 安装

公开包下载不需要 key；安装/激活必须有 agent key。

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh --key taa_xxx
```

也可以先下载包，再运行包内安装器：

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-complete-0.4.1.tar.gz -o /tmp/taa.tgz
mkdir -p /tmp/taa-install && tar xzf /tmp/taa.tgz -C /tmp/taa-install
/tmp/taa-install/taa_agent/install.sh --key taa_xxx
```

每台电脑创建自己的 agent + key；第二台电脑不要复制第一把 key。
同 LAN 有在线 TAA 节点时，优先从节点拉包：

```bash
curl -fsSL "http://<node-ip>:6080/install.sh" -o /tmp/taa-install.sh
bash /tmp/taa-install.sh --key taa_xxx \
  --from "http://<node-ip>:6080/dist/taa-complete-latest.tar.gz"
```

## 文档

公开文档在 [`docs/`](docs/README.md)：

- [快速开始](docs/QUICKSTART.md)
- [安装](docs/INSTALL.md)
- [Agent 与第二台电脑](docs/AGENT.md)
- [Key](docs/KEY.md)
- [下载与本地节点](docs/DOWNLOAD.md)
- [工具](docs/TOOLS.md)
- [天气](docs/WEATHER.md)
- [调研](docs/RESEARCH.md)
- [常见问题](docs/FAQ.md)

## 默认工具

### weather

需要合法地点，例如 `成都`、`Shanghai`。
地点无法解析时会明确报错，不伪造天气。

没有衣柜时返回通用建议，不会伪造个人风格；建立 `persona.wardrobe` 后按本人衣柜推荐。

### research.ask

七步调研工作流：

```text
大纲 → 查资料 → 事实库 → 写作 → 核查 → 微调 → 提交
```

## 本地 core

```bash
~/.taa/app/bin/taa-core
```

首次运行会在 `TAA_HOME` 创建本地数据库、agent、bootstrap 和上传目录。

## 不包含

- 中心鉴权 / Team / 节点目录 / 中继
- 私有工具与私有数据
- 个人 presets / wardrobe
- 任何 key、token、证书、邀请码
- 第二台电脑的共享 key（每台电脑独立 agent + key）

## 版本

```text
TAA Complete 0.4.1
runtime 2.2.48
```

校验：`SHA256SUMS`。
