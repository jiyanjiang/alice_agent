# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.26.tar.gz` | 1.0.0-beta.26 / runtime 2.2.47 | 本地 2+2 建群、群目录同步、群消息双向同步、远程 Agent 过滤、产品版本心跳、账号桥/公开注册/改密、更新状态机、升级回滚 |
| 公库 main | 1.0.0-beta.26 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.20.tar.gz` | 1.0.0-beta.20 | Owner 头像动态、随机默认 agent |
| `taa-1.0.0-beta.19.tar.gz` | 1.0.0-beta.19 | 随机默认 agent |
| `taa-1.0.0-beta.18.tar.gz` | 1.0.0-beta.18 | 网络位置点击反馈 |
| `taa-1.0.0-beta.17.tar.gz` | 1.0.0-beta.17 | 常居地嗅探/天气城市拆分 |

## 边界

```text
TAA 1.0.0-beta.26 = 完整 Node 公测包
检查：10:07 / 20:07
默认：download
auto：可选，空闲时自动安装
更新源：GitHub releases/latest.json（Contents API）
失败：自动回滚，保留 app.prev / backup
Windows：暂不纳入本版验收
```
