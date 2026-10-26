# TAA 1.0.0-beta.16 · 公测

- 产品版本：`1.0.0-beta.16`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.16.tar.gz`
- 大小：3,232,897 bytes
- SHA256：`008a9c48d657aa924e2f2881886e08bb0cd286971a133918d39a972af9a2e675`

## 本版内容

- 新增 `/app/settings/profile`：Owner 公开主页编辑页，接入统一四栏页面规格。
- `/app/settings` 账号卡片增加“公开主页”入口。
- `/setup/profile` 对已连接节点 302 到 `/app/settings/profile`，兼容旧链接。
- `/setup/account`、`/setup/friends` 的“编辑公开主页”链接改到新页面。
- 新页面支持：公开 ID、公开 URL、本地二维码、显示名、简介、常居地、常居地显隐。
- 简介 500 字符前端计数 + 服务端校验；Markdown / LaTeX 提示。
- 二维码本地生成，不调用第三方二维码服务。
- 保留 beta.15 runtime 上报/更新状态机、beta.14 工具页统一、缩略图/升级/回滚修复。

## 验证

```text
/app/settings → 公开主页 点击可达
/app/settings/profile 200，side/detail/toggle 存在
公开 ID / 公开 URL / 二维码正常
1600 / 390 无横向滚动
保存同一资料成功并提示“公开主页已更新”
501 字符简介 POST 返回 400，未写入中心
/setup/profile → 302 /app/settings/profile
```

## 已知限制

```text
Windows 原生升级未验证（本轮不做）
真实两物理机 2 真人 + 2 agent 待明天验收
```
