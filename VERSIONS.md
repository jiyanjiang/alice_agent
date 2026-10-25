# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.4.tar.gz` | 1.0.0-beta.4 / runtime 2.2.47 | Core、Runtime、中心 TAA 账号、Node/Agent、自动查重、大小写不敏感、claim、`/app`、P2P、组授权、加密备份、weather、research.ask |
| 公库 main | 1.0.0-beta.4 | installer、包、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.2.tar.gz` | 1.0.0-beta.2 / runtime 2.2.47 | 上一公测版本，保留回滚 |
| `taa-1.0.0-beta.1.tar.gz` | 1.0.0-beta.1 / runtime 2.2.47 | 更早公测版本 |
| `taa-node-v05-0.5.1.tar.gz` | Node 0.5.1 | 旧 Node 身份包，rollback |
| `taa-node-v05-0.5.0.tar.gz` | Node 0.5.0 | 更旧 Node 身份包，rollback |
| `taa-complete-0.4.1.tar.gz` | Complete 0.4.1 / runtime 2.2.48 | 旧完整 core，legacy |

`1.0.0-beta.3` 未作为公开包发布，仅作为内部候选。

## 边界

```text
TAA 1.0.0-beta.4 = 完整 Node 公测包
Center = 独立部署，不打进用户包
中心是唯一 Owner 账号源；本机只保存 Node/Agent
用户名自动查重，且不区分大小写
Physics World / APS / sources / 工具市场执行 = 不在当前包
中心通知端点 = 未进入 beta.4（本地 /app/inbox 通知可用）
```

本地入口：

```text
http://127.0.0.1:6080/app
/setup/ = 首次创建/登录 TAA 账号
/app/bridge = 建立本地会话
```
