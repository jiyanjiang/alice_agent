# TAA 1.0.0-beta.9 · 公测

- 产品版本：`1.0.0-beta.9`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.9.tar.gz`
- 大小：3,227,609 bytes
- SHA256：`3a75e2689267351a3785958e815c304c912cde5e7705770e364c8c138244ff96`

## 本版内容

- 自动检查更新：`notify / download / auto`
- 默认 `download`，检查时间 `10:07 / 20:07`
- 更新检查通过 GitHub Contents API 读取 `releases/latest.json`，避免 raw 分支缓存读到旧版本
- `/app/version` 更新卡片
- `/app/inbox` 更新通知
- `/app/settings` 更新模式
- 修复 Python 3.10 下 tar 解包兼容性
- 继续保留原子升级 / 自动回滚 / 数据保护清单

## 验证

```text
beta.6 -> beta.7 原子升级
beta.5 -> beta.6 原子升级
强制健康失败 -> 自动回滚
beta.9 更新页/设置页/通知入口
GitHub API latest.json 读取
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
taa-1.0.0-beta.8.tar.gz
taa-1.0.0-beta.7.tar.gz
taa-1.0.0-beta.6.tar.gz
```
