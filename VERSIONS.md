# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.29.tar.gz` | 1.0.0-beta.29 / runtime 2.2.47 | 直连 peer 优先、中心不可达仍先直连、HMAC 群消息、直连图片、群消息后台同步、异步更新检查、手动更新无上限 |
| 公库 main | 1.0.0-beta.29 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.28.tar.gz` | 1.0.0-beta.28 | 异步更新检查、raw fallback |
| `taa-1.0.0-beta.27.tar.gz` | 1.0.0-beta.27 | 直连 peer 基础、群消息后台同步 |
| `taa-1.0.0-beta.26.tar.gz` | 1.0.0-beta.26 | 群目录/消息中心同步、产品版本心跳 |
| `taa-1.0.0-beta.20.tar.gz` | 1.0.0-beta.20 | Owner 头像动态、随机默认 agent |

## 边界

```text
TAA 1.0.0-beta.29 = 完整 Node 公测包
直连：6090，需端点可达；中心只做目录和失败回退
检查：自动 2 次/天；手动无限且异步
安装：自动 1 次/天且空闲；手动无限
更新源：GitHub raw latest.json，API fallback
Windows：暂不纳入本版验收
```
