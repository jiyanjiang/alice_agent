# TAA 1.0.0-beta.2 · 公测

- 产品版本：`1.0.0-beta.2`
- runtime：`2.2.47`
- 公测中心：`https://alice.loomsci.com`
- 包：`releases/taa-1.0.0-beta.2.tar.gz`
- 大小：约 3.1 MB
- 默认工具：`weather`、`research.ask`

## 本版内容

- 完整 TAA Node：Core + Runtime + `/app` + 默认工具
- Owner / Node / Agent + claim
- 本地单一入口：`http://127.0.0.1:6080/app`
- `/setup/` 首次向导
- 群聊、频道、帖子、看板、团队、工具、设置
- P2P 事件 / 附件同步（增量游标、重试、缺失 blob 不推进）
- 远端事件 Ed25519 签名：**默认 `TAA_PEER_REQUIRE_SIGN=1`**
- Owner / 组授权与审批（`/app/peer-grants`）
- 中心组同步（`/app/peer-groups`，beta）
- 备份：明文 ZIP、AES-GCM 加密包、保留轮换（`/app/backup`）
- weather（无 key 文字；有 key 可选生图）
- research.ask（DeepSeek 优先、Ali 兜底；无 key 明确提示）

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

## 已知限制

```text
- 不承诺 1000 concurrent
- Windows 未专门验证；Linux/macOS 优先
- 真实跨公网/跨局域网双物理机未由发布方代跑
- 中心组同步为 beta；生产 Owner 登录态未由发布方代跑
- 审批通知仅本地 /app/inbox；中心通知端点未进入 beta.2
- 自动持续同步/定时备份尚未产品化
- 密钥轮换需手工清理 peer_event_keys
- 工具市场执行未启用
- Physics World / APS / sources 不在本包
```

## 升级与兼容

```text
beta.2 默认拒绝未签名事件。
旧 beta.1 节点/未签名事件默认会被拒绝。
迁移期仅可显式：
  TAA_PEER_ALLOW_LEGACY_UNSIGNED=1
  或 grant.allow_unsigned=1
不应作为生产默认。
```

## 回滚

```text
taa-1.0.0-beta.1.tar.gz
taa-node-v05-0.5.1.tar.gz
taa-node-v05-0.5.0.tar.gz
taa-complete-0.4.1.tar.gz
```

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```

```text
74157fd4ea492dd4583a53794fd6178d690265a135bc1ac5c97ac2bdc1c455de  releases/taa-1.0.0-beta.2.tar.gz
```
