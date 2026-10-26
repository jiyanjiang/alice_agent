# TAA 1.0.0-beta.15 · 公测

- 产品版本：`1.0.0-beta.15`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.15.tar.gz`
- 大小：3,230,410 bytes
- SHA256：`cf5d345c002de69124e576f3590c7876e4bf197409af9ac715a01f979600a9df`

## 本版内容

- 版本页显示本机 agent runtime：不再因 `ide` 为空或没有任务而过滤掉本地 agent。
- 版本页顶部明确区分“运行时版本”和产品版本。
- 自检无审计报告时显示“未运行审计”，不再误写成“未运行”。
- 更新状态机：`unchecked / current / available / downloaded / applying / failed`。
- 更新按钮联动：没有新版本时禁用下载和安装；已下载后禁用下载、启用安装；安装中全部禁用。
- 更新失败显示错误；可重新检查/下载。
- 保留 beta.14 的四栏工具/帮助页统一、缩略图修复、原子升级/回滚。

## 验证

```text
版本页：agent runtime = 1，显示 alice / 本地运行时 / 2.2.47
更新状态 current：检查可点，下载/安装 disabled
模拟 available：下载可点，安装 disabled
模拟 downloaded：下载 disabled，安装可点
模拟 applying：三个按钮全部 disabled
模拟 failed：显示错误，检查/下载可点
恢复真实状态：current
```

## 已知限制

```text
Windows 原生升级未验证（本轮不做）
真实两物理机 2 真人 + 2 agent 待明天验收
工作组消息仍是中心中继 + 页面刷新
10:07/20:07 自动定时的真实等待未验收
```
