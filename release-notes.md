# TAA 1.0.0-beta.8 · 公测

- 产品版本：`1.0.0-beta.8`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.8.tar.gz`
- 大小：3,227,508 bytes
- SHA256：`0bc9f7f1c234f46a19d5dea9eba1a7a4ccebaf9d12edabb3a6c9d30e442146e6`

## 本版内容

- 自动检查更新：`notify / download / auto`
- 默认 `download`
- 检查时间：`10:07 / 20:07`
- `/app/version` 更新卡片
- `/app/inbox` 更新通知
- `/app/settings` 更新模式
- 新增 `releases/latest.json`
- 修复 Python 3.10 下 tar 解包兼容性
- 继续保留原子升级 / 自动回滚 / 数据保护清单

## 验证

```text
beta.7 -> beta.8 自动下载/安装链路（本机实测）
beta.6 -> beta.7 原子升级
beta.5 -> beta.6 原子升级
强制健康失败 -> 自动回滚
```

## 已知限制

```text
Windows 原生未验证
真实两物理机 2 真人 + 2 agent 待验收
工作组消息仍是中心中继 + 页面刷新
```

## 回滚

```text
taa-1.0.0-beta.7.tar.gz
taa-1.0.0-beta.6.tar.gz
taa-1.0.0-beta.5.tar.gz
```
