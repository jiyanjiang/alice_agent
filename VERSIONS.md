# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.28.tar.gz` | 1.0.0-beta.28 / runtime 2.2.47 | 直连 peer 监听、中心端点登记、HMAC 群消息、直连图片、群消息后台同步、异步更新检查、raw fallback、手动更新无上限 |
| 公库 main | 1.0.0-beta.28 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.27.tar.gz` | 1.0.0-beta.27 | 直连 peer 基础、群消息后台同步 |
| `taa-1.0.0-beta.26.tar.gz` | 1.0.0-beta.26 | 群目录/消息中心同步、产品版本心跳 |
| `taa-1.0.0-beta.20.tar.gz` | 1.0.0-beta.20 | Owner 头像动态、随机默认 agent |
| `taa-1.0.0-beta.19.tar.gz` | 1.0.0-beta.19 | 随机默认 agent |

## 边界

```text
TAA 1.0.0-beta.28 = 完整 Node 公测包
检查：自动 2 次/天；手动无限且异步
安装：自动 1 次/天且空闲；手动无限
默认：download
更新源：GitHub raw latest.json，API fallback
失败：自动回滚，保留 app.prev / backup
Windows：暂不纳入本版验收
```
