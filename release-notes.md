# TAA 1.0.0-beta.26 · 公测

- 产品版本：`1.0.0-beta.26`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.26.tar.gz`
- 大小：3,239,764 bytes
- SHA256：`a67e837e0fb4ac2a4ae80c43b16fc2240315d7fc57bcb0ba2cc10eed5054ab23`

## 本版内容

- 本地建群 UI：自己的 Agent 与真人好友分区，好友自动带 primary Agent。
- 中心群目录同步：本地群创建后登记中心 `collab_groups`，对端本地可拉取群镜像。
- 群消息双向同步：本地消息推送中心 group message，中心消息拉取到本地 `room_messages`。
- 远程 Agent 不再被本机执行器误当成本机 Agent，避免重复执行回执。
- Node 心跳上报产品版本与 runtime 版本；中心 Node 名片可显示版本。
- 保留头像动态、随机默认 Agent、公开注册、改密、更新状态机、升级回滚。

## 验证

```text
群成员 4：2 humans + 2 agents
本地群 → 中心消息：PASS
中心消息 → 本地 room_messages：PASS
同 LAN 消息路径：待接
跨 LAN 直连/中继：待接
Agent 唯一 handle：待接
```

## 已知限制

```text
Agent 命名去重尚未迁移，当前仍可能重名
同 LAN 直连优先级尚未实现，目前使用中心 group message 同步
跨 LAN 直连 / 中继 fallback 尚未实现
Windows 原生升级未验证
```
