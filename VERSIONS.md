# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.6.tar.gz` | 1.0.0-beta.6 / runtime 2.2.47 | 数据保护清单、原子升级、自动回滚、events.db 迁移、公开主页、好友、2+2 工作组、中心中继消息 |
| 公库 main | 1.0.0-beta.6 | installer、包、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.5.tar.gz` | 1.0.0-beta.5 / runtime 2.2.47 | 上一公测版本，保留回滚 |
| `taa-1.0.0-beta.4.tar.gz` | 1.0.0-beta.4 / runtime 2.2.47 | 更早公测版本 |
| `taa-1.0.0-beta.2.tar.gz` | 1.0.0-beta.2 / runtime 2.2.47 | 更早公测版本 |
| `taa-1.0.0-beta.1.tar.gz` | 1.0.0-beta.1 / runtime 2.2.47 | 更早公测版本 |

`1.0.0-beta.3` 未作为公开包发布。

## 边界

```text
TAA 1.0.0-beta.6 = 完整 Node 公测包
升级：完整包 + 数据保护 + 原子切换 + 自动回滚
新安装：从 0
events.db：默认 ~/.taa/events.db
旧位置 app/events.db：升级时迁移并保留备份
工作组消息：中心 HTTPS 中继 + 页面刷新
```

本地入口：

```text
http://127.0.0.1:6080/app
/setup/ = 首次创建/登录 TAA 账号
/setup/profile = 公开主页
/setup/friends = 好友
/setup/groups = 工作组
```
