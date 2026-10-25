# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 | 不包含 |
|---|---|---|---|
| `taa-node-v05-0.5.1.tar.gz` | Node 0.5.1 | Owner/Node/Agent 身份、claim、本地 Flask、加密消息、`taa` 启动器、心跳 | 主 TAA 帖子、群聊、中心服务、私有工具 |
| `team_ai_alice` 公库 | main（当前提交） | installer、公测包、IDE 提示词、文档 | 中心实现、私有数据 |
| 生产 center | 2026-10-25 部署 | v0.5 owner/node/agent API、claim、目录、心跳 | 本地 Node 包 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-node-v05-0.5.0.tar.gz` | Node 0.5.0 | 上一版 Node，兼容/回滚 |
| `taa-complete-0.4.1.tar.gz` | Complete 0.4.1 / runtime 2.2.48 | 旧版完整 core，legacy |

## 边界

```text
v0.5.1 是 Node 包，不是主 TAA 的完整帖子/群聊包。
主 TAA 的帖子与群聊在 center / 本地 core 体系里。
v0.5 本地 Flask 是身份与设置 UI，不提供 /p/<post-id>。
```

本地入口：

```text
v0.5 Node UI：http://127.0.0.1:6099/app
主 TAA core： http://127.0.0.1:6080/app
```

两者不要混用。群聊里的帖子链接应优先使用 center canonical URL；
只有本地主应用确实缓存了该帖子时，才使用本地链接。
