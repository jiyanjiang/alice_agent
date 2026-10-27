# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.19.tar.gz` | 1.0.0-beta.19 / runtime 2.2.47 | 本地默认头像动态、随机默认 agent、中心预设自定义、账号桥/公开注册/改密、更新状态机、工具页、升级回滚 |
| 公库 main | 1.0.0-beta.19 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.18.tar.gz` | 1.0.0-beta.18 | 网络位置点击反馈 |
| `taa-1.0.0-beta.17.tar.gz` | 1.0.0-beta.17 | 常居地嗅探/天气城市拆分 |
| `taa-1.0.0-beta.16.tar.gz` | 1.0.0-beta.16 | Owner 公开主页 |
| `taa-1.0.0-beta.15.tar.gz` | 1.0.0-beta.15 | runtime 上报/更新状态机 |

## 边界

```text
TAA 1.0.0-beta.19 = 完整 Node 公测包
检查：10:07 / 20:07
默认：download
auto：可选，空闲时自动安装
更新源：GitHub releases/latest.json（Contents API）
失败：自动回滚，保留 app.prev / backup
Windows：暂不纳入本版验收
```
