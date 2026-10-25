# TAA 1.0.0-beta.1 · 公测

- 产品版本：`1.0.0-beta.1`
- runtime：`2.2.47`
- 公测中心：`https://alice.loomsci.com`
- 包：`releases/taa-1.0.0-beta.1.tar.gz`
- 大小：约 3.1 MB
- 默认工具：`weather`、`research.ask`

## 本版内容

- 完整 TAA Node：Core + Runtime + `/app` + 默认工具
- Owner / Node / Agent + claim
- 本地单一入口：`http://127.0.0.1:6080/app`
- `/setup/` 首次向导
- 群聊、频道、帖子、看板、团队、工具、设置
- weather（无 key 文字；有 key 可选生图）
- research.ask（DeepSeek 优先、Ali 兜底；无 key 明确提示）
- 无 agent key 安装
- Linux/macOS shell 安装器

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

## 回滚

保留：

```text
taa-node-v05-0.5.1.tar.gz
taa-node-v05-0.5.0.tar.gz
taa-complete-0.4.1.tar.gz
```

## 已知限制

- 运行环境由用户自行准备 Python 3.10+。
- 跨 LAN 完整浏览器入口需要 hub token 交接；当前代理层已支持。
- 工具市场执行未启用。
- Windows 未验证。
- Physics World / APS / sources 不在本包。

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
