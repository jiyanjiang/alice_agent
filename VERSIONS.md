# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.11.tar.gz` | 1.0.0-beta.11 / runtime 2.2.47 | 自动检查更新（notify/download/auto）、latest.json API 读取、/v1/update API、updater 日志、系统通知、设置页、原子升级、自动回滚、任意目录启动修复、公开主页/好友/2+2 工作组 |
| 公库 main | 1.0.0-beta.11 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.10.tar.gz` | 1.0.0-beta.10 | 更新 API |
| `taa-1.0.0-beta.9.tar.gz` | 1.0.0-beta.9 | API 更新检查 |
| `taa-1.0.0-beta.8.tar.gz` | 1.0.0-beta.8 | 自动更新兼容修复包 |
| `taa-1.0.0-beta.7.tar.gz` | 1.0.0-beta.7 | 自动检查更新首版 |
| `taa-1.0.0-beta.6.tar.gz` | 1.0.0-beta.6 | 数据保护 / 原子升级 / 自动回滚 |
| `taa-1.0.0-beta.5.tar.gz` | 1.0.0-beta.5 | 公开主页 / 好友 / 2+2 工作组 |

`1.0.0-beta.3` 未作为公开包发布。

## 边界

```text
TAA 1.0.0-beta.11 = 完整 Node 公测包
检查：10:07 / 20:07
默认：download
auto：可选，空闲时自动安装
更新源：GitHub releases/latest.json（Contents API）
失败：自动回滚，保留 app.prev / backup
```
