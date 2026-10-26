# TAA 1.0.0-beta.14 · 公测

- 产品版本：`1.0.0-beta.14`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.14.tar.gz`
- 大小：3,229,789 bytes
- SHA256：`aee3af9d912eab066928193eb24639d95cc0ccaf0e3a699e7abda14be5289c9e`

## 本版内容

- 统一设置页进入的本地工具/帮助页：HTTPS/CA、P2P 同步、跨 Owner 授权、本机备份、中心组同步、Key 帮助。
- 所有页面统一为：左侧 rail + 侧栏 + 主区 + 详情栏，顶部“详情”可收起/展开。
- 修复 `/app/peer-grants` 因只读连接执行建表导致的 500。
- 修复备份页按钮被 flex 挤压成竖排/圆形的问题。
- 修复中心组同步表头挤在一起、无表格边框的问题。
- 修复帮助页长命令被卡片右侧裁切的问题。
- 版本页“TAA 当前版本”改为“TAA 运行时版本”，避免和产品版本混淆。
- 保留自动更新、缩略图软链修复、启动器 cwd 修复、原子升级/回滚。

## 验证

```text
/app/help/https /app/help/keys /app/peer-sync /app/peer-grants
/app/backup /app/peer-groups 全部 200
每页 side/detail/toggle 存在
每页 1600/390 无横向滚动
设置页点击五个入口均到达目标页
备份下载产生 taa-backup.zip
中心组同步未配置时按钮 disabled
```

## 已知限制

```text
Windows 原生升级未验证（当前不纳入本版验收）
真实两物理机 2 真人 + 2 agent 待用户明天验收
工作组消息仍是中心中继 + 页面刷新
自动定时 10:07/20:07 的真实等待未验收
```
