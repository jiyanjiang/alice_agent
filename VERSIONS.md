# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.5.tar.gz` | 1.0.0-beta.5 / runtime 2.2.47 | Core、Runtime、中心 TAA 账号、Owner 公开主页、简介/常居地/LaTeX/二维码、好友、2+2 工作组目录与中心中继消息、P2P、组授权、加密备份 |
| 公库 main | 1.0.0-beta.5 | installer、包、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.4.tar.gz` | 1.0.0-beta.4 / runtime 2.2.47 | 上一公测版本，保留回滚 |
| `taa-1.0.0-beta.2.tar.gz` | 1.0.0-beta.2 / runtime 2.2.47 | 更早公测版本 |
| `taa-1.0.0-beta.1.tar.gz` | 1.0.0-beta.1 / runtime 2.2.47 | 更早公测版本 |
| `taa-node-v05-0.5.1.tar.gz` | Node 0.5.1 | 旧 Node 身份包，rollback |
| `taa-node-v05-0.5.0.tar.gz` | Node 0.5.0 | 更旧 Node 身份包，rollback |
| `taa-complete-0.4.1.tar.gz` | Complete 0.4.1 / runtime 2.2.48 | 旧完整 core，legacy |

`1.0.0-beta.3` 未作为公开包发布。

## 边界

```text
TAA 1.0.0-beta.5 = 完整 Node 公测包
Center = 独立部署，不打进用户包
中心是唯一 Owner 账号源；本机只保存 Node/Agent
公开主页 / 好友 / 工作组目录
工作组消息：中心 HTTPS 中继 + 页面刷新，非实时 WebSocket
中心通知端点 = 未进入 beta.5（本地 /app/inbox 通知可用）
```

本地入口：

```text
http://127.0.0.1:6080/app
/setup/ = 首次创建/登录 TAA 账号
/setup/profile = 公开主页
/setup/friends = 好友
/setup/groups = 工作组
```
