# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.15.tar.gz` | 1.0.0-beta.15 / runtime 2.2.47 | 自动更新状态机、本机 runtime 上报显示、四栏工具/帮助页、缩略图修复、原子升级/回滚、公开主页/好友/2+2 工作组 |
| 公库 main | 1.0.0-beta.15 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.14.tar.gz` | 1.0.0-beta.14 | 工具/帮助页四栏统一 |
| `taa-1.0.0-beta.13.tar.gz` | 1.0.0-beta.13 | 缩略图与 UI 补丁 |
| `taa-1.0.0-beta.12.tar.gz` | 1.0.0-beta.12 | UI 溢出修复 |
| `taa-1.0.0-beta.11.tar.gz` | 1.0.0-beta.11 | 启动器 cwd 修复 |
| `taa-1.0.0-beta.10.tar.gz` | 1.0.0-beta.10 | 更新 API |
| `taa-1.0.0-beta.9.tar.gz` | 1.0.0-beta.9 | API 更新检查 |
| `taa-1.0.0-beta.8.tar.gz` | 1.0.0-beta.8 | 自动更新兼容修复包 |

## 边界

```text
TAA 1.0.0-beta.15 = 完整 Node 公测包
检查：10:07 / 20:07
默认：download
auto：可选，空闲时自动安装
更新源：GitHub releases/latest.json（Contents API）
失败：自动回滚，保留 app.prev / backup
Windows：暂不纳入本版验收
```
