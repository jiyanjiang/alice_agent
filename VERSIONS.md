# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.17.tar.gz` | 1.0.0-beta.17 / runtime 2.2.47 | 常居地一键网络位置、公开显示/天气城市拆分、Owner 公开主页、更新状态机、runtime 上报、工具页统一、缩略图/升级/回滚修复 |
| 公库 main | 1.0.0-beta.17 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.16.tar.gz` | 1.0.0-beta.16 | Owner 公开主页接入 settings |
| `taa-1.0.0-beta.15.tar.gz` | 1.0.0-beta.15 | runtime 上报 + 更新状态机 |
| `taa-1.0.0-beta.14.tar.gz` | 1.0.0-beta.14 | 工具/帮助页四栏统一 |
| `taa-1.0.0-beta.13.tar.gz` | 1.0.0-beta.13 | 缩略图与 UI 补丁 |

## 边界

```text
TAA 1.0.0-beta.17 = 完整 Node 公测包
检查：10:07 / 20:07
默认：download
auto：可选，空闲时自动安装
更新源：GitHub releases/latest.json（Contents API）
失败：自动回滚，保留 app.prev / backup
Windows：暂不纳入本版验收
```
