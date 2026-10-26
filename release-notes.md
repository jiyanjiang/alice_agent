# TAA 1.0.0-beta.12 · 公测

- 产品版本：`1.0.0-beta.12`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.12.tar.gz`
- 大小：3,227,980 bytes
- SHA256：`3042925352b1df11fd07a0da4b77816720b0ff682b11929373c7b9f0135a03a2`

## 本版内容

- 自动检查更新：`notify / download / auto`
- 默认 `download`，检查时间 `10:07 / 20:07`
- 更新检查通过 GitHub Contents API 读取 `releases/latest.json`
- 更新 API：`/v1/update/status|check|download|apply|settings`
- `/app/version`、`/app/inbox`、`/app/settings`
- 修复版本页 TAA UPDATE 卡片缺少 `sec` 内边距、内容贴边/出血
- 修复设置页更新模式下拉框挤压“保存”按钮
- updater 日志：`~/.taa/updates/updater.log`
- 修复从任意目录启动时 agent 工作目录错误
- 保留原子升级 / 自动回滚 / 数据保护清单

## 验证

```text
1600 / 1720 / 1800 / 2000 宽度：更新卡片都在主区内，无横向溢出
900 / 390 宽度：更新卡片右边界 <= 视口，无横向滚动
版本页、设置页、收件箱、频道、看板、团队、会话、首页截图
详情面板打开/关闭、检查更新、下载、设置页模式切换
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
taa-1.0.0-beta.11.tar.gz
taa-1.0.0-beta.10.tar.gz
taa-1.0.0-beta.9.tar.gz
```
