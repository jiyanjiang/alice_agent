# TAA 1.0.0-beta.11 · 公测

- 产品版本：`1.0.0-beta.11`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.11.tar.gz`
- 大小：3,227,879 bytes
- SHA256：`081ed61d410f57a5d048b5057621d4e5641b5d8a6fd4093375638378f42cc325`

## 本版内容

- 自动检查更新：`notify / download / auto`
- 默认 `download`，检查时间 `10:07 / 20:07`
- 更新检查通过 GitHub Contents API 读取 `releases/latest.json`，避免 raw 分支缓存读到旧版本
- 更新 API：`/v1/update/status|check|download|apply|settings`
- `/app/version` 更新卡片、`/app/inbox` 通知、`/app/settings` 更新模式
- updater 日志：`~/.taa/updates/updater.log`
- 修复从任意目录启动时 agent 工作目录错误（`ROOT=Path.cwd()` 读取不到 `.key`）
- 保留原子升级 / 自动回滚 / 数据保护清单

## 验证

```text
beta.8 -> beta.9 包下载 + SHA256 + bytes 校验
beta.8 -> beta.9 隔离升级 + health + committed
缺少 identity -> PREFLIGHT 拒绝
缺少 events.db -> 升级后检查失败 -> 自动回滚
beta.9 -> beta.10 / beta.10 -> beta.11 本机原子升级
beta.11 启动后 agent 运行
```

## 已知限制

```text
Windows 原生未验证
真实两物理机 2 真人 + 2 agent 待验收
工作组消息仍是中心中继 + 页面刷新
自动定时 10:07/20:07 的真实等待未验收
```

## 回滚

```text
taa-1.0.0-beta.10.tar.gz
taa-1.0.0-beta.9.tar.gz
taa-1.0.0-beta.8.tar.gz
```
