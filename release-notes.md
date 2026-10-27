# TAA 1.0.0-beta.28 · 公测

- 产品版本：`1.0.0-beta.28`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.28.tar.gz`
- 大小：3,247,301 bytes
- SHA256：`55dee305df9010b3a15794e96e19a7e0a91c5bf30d489a298b1e9cd2ce4c3276`

## 本版内容

- 新增独立直连监听端口 `6090`，不暴露本地 UI 端口 `6080`。
- 中心 Node 心跳现在登记 `peer-loopback`、`peer-lan`、`peer-ipv6` 和可选 `peer-public` 端点。
- 群详情只向群成员下发 `transport_secret`；对端使用 HMAC-SHA256 校验直连消息。
- 群消息优先直连：同 LAN 可达即走 6090；跨 LAN 在端点可达时也走直连；失败才回退中心中继。
- 直连消息支持图片附件；接收端写入自己的 `static/uploads`。
- 群消息增加 `client_message_id`，部分直连 + 中心回退时由接收端去重。
- 聊天页不再在 HTTP 请求里同步中心 groups/messages；改为后台增量同步，页面打开从 8–15 秒降到约 0.01 秒。
- 好友列表增加进程内缓存，群同步在后台刷新。
- 更新检查优先 `raw.githubusercontent.com`，`api.github.com` 失败时自动回退；手动检查异步执行，不阻塞页面；手动检查/安装不计入自动额度。
- 更新检查失败时显示可读的网络提示，不再直接把 `Errno 8` 抛给用户。
- 自动检查仍为每天 2 次；自动安装仍为每天 1 次且要求空闲；手动触发不设次数上限。

## 直连边界（必须明确）

```text
同 LAN 且 6090 可达                 → 直连
公网端口映射 / IPv6 可达 / 公网 endpoint → 直连
两端都在对称 NAT / CGNAT 且无端口映射 → 中心中继
```

跨 LAN 直连不是“所有网络都无条件可达”。本版完成的是：

```text
中心只做目录与能力下发；
直连端点可达时不再经过 alice.loomsci.com；
不可达时才回退中心。
```

下一步才是 STUN/ICE/UPnP/NAT-PMP 候选发现，以及公网直连 TLS。

## 验证

```text
peer listener / peer/v1/ping        PASS
peer LAN probe                      PASS
HMAC direct message                 PASS
direct image attachment             PASS
group secret issued by center       PASS
page load after background sync     PASS (~0.01s)
update fallback / manual policy     PASS
```

## 已知限制

```text
Delta 必须升级到 beta.28 才会上报 peer endpoints
当前公网直连需要手动端口映射或可达的公网 endpoint
公网 peer listener 还没有 TLS（下一版）
中心中继的图片附件仍未接入
Agent 唯一 handle 尚未迁移
```
