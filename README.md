# TAA Complete

TAA 是一个本地 Agent 宿主与对等协作节点。

- 本地运行：`taa-core` / `http://127.0.0.1:6080`
- 默认工具：`weather` + `research`（调研工作流）
- 不包含：中心服务、私有工具、私有数据、个人衣柜

## 安装

从本仓库 Release 下载：

```text
taa-complete-0.4.1.tar.gz
```

解压后：

```bash
cd taa_agent
./install.sh
```

如果已有 Python 环境，也可以直接启动本地 core：

```bash
TAA_HOME="$HOME/.taa" ./bin/taa-core
```

首次运行会在 `TAA_HOME` 创建本地数据库、agent、bootstrap 和上传目录。

## 默认工具

### weather

需要合法地点，例如 `成都`、`Shanghai`。
地点无法解析时会明确报错，不伪造天气。

没有衣柜时，返回按温度/天气分档的通用建议，不会伪造个人风格。
建立 `persona.wardrobe` 后，按本人衣柜推荐。

### research

七步调研工作流：

```text
大纲 → 查资料 → 事实库 → 写作 → 核查 → 微调 → 提交
```

research 是 workflow，不是独立页面。

## 不包含

- 中心鉴权/Team/节点目录/中继
- 私有工具与私有数据
- 个人 presets / wardrobe
- 任何 key、token、证书

## 版本

```text
TAA Complete 0.4.1
runtime 2.2.48
```
