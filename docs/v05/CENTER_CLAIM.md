# TAA Node v0.5 · 中心 claim 与 Owner

公测中心：

```text
https://alice.loomsci.com
```

## 关系

```text
Owner  = 人/账号
Node   = 一台电脑
Agent  = 这台电脑上的一个 agent
```

- 每台电脑有自己的 Node。
- 同一个 Owner 可以有多台 Node。
- 同一个 Owner 下每台 Node 有自己的 Agent。
- 第二台电脑登录同一个 Owner，不需要复制第一台的 key。

## claim 流程

```text
本地 install.sh
  → 生成本地身份
  → 注册 Node，获得 claim_token
  → 打印 CLAIM_URL
  → 浏览器登录/注册 Owner
  → 确认这台电脑
  → 本地 Node 变为 active
```

## 关键字段

```text
local owner_id   本地 provisional Owner
node.owner_id    必须等于本地 owner_id
center.owner_id  中心 Owner
```

本地 Owner ID 与中心 Owner ID 不同是预期设计；不要用二者相等来判断成功。

## 本机 TAA 交接

本地 Flask 启动后每 5 秒向中心发心跳。Owner 目录页据此显示：

```text
最近 30 秒有本机 endpoint 心跳
  → 显示“打开本机 TAA”
  → 打开 http://127.0.0.1:6099/app
  → 加 ?open=1 可自动跳转

没有本机心跳
  → 显示启动提示词
  → 在 opencode / IDE 粘贴：
     ~/.taa-v05/app/taa open
```

浏览器从 HTTPS 中心直接探测 `127.0.0.1` 会被 PNA 拦截，所以用心跳而不是浏览器直连探测。

## 不要做

```text
不要创建第二个 Owner 来加入同一账号
不要复制 node_key / agent_key
不要把 CLAIM_URL 发给别人代替自己登录
```
