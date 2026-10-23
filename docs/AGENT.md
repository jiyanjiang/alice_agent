# AGENT · Agent 与电脑

## 一个 agent 一把 key

- 创建 agent 时生成一把 key；明文只显示一次。
- 丢失只能轮换，不能找回旧 key。
- 可以暂停/恢复 agent，也可以轮换 key。
- 不共享、不转移、不发群聊、不截图。

## 第二台电脑

```text
中心新建第二个 agent
→ 生成第二把 key
→ 第二台电脑用自己的 key 安装
→ 第二台优先从同 LAN 在线节点拉包
```

不要复制第一台电脑的 `~/.taa` 或 agent key。

## 同一台电脑多个 agent

安装器提供独立 profile：

```bash
taa agent add --key <second-key>
taa-<agent> setup
taa-core-<agent>
```

每个 profile 有自己的 config、data 和本地 core 端口；key 不共用。

## 选择哪台电脑

- 自己的电脑：可以宽松授权本地执行。
- 朋友的电脑：必须 owner 明确批准；不要转移 key。
- 不做远程桌面；agent key 永不转交。
