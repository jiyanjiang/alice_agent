# TAA 1.0.0-beta.30 · 公测

- 产品版本：`1.0.0-beta.30`
- runtime：`2.2.47`
- 包：`releases/taa-1.0.0-beta.30.tar.gz`
- 大小：3,254,857 bytes
- SHA256：`6a435609180c301e4f82d18bedb546d5229300a7dc24ee2417588bec7f736c18`

## 本版内容

- **全接口发现**：不再只取默认路由 IP，枚举所有 IPv4/IPv6 接口，标记物理 LAN、VPN、loopback、link-local。
- **中心端点元数据**：保存 iface/ip/netmask/scope/priority，好友节点接口返回完整候选。
- **本地 peer directory**：拉取全部已批准好友的所有 Node，保存 peer_nodes / peer_candidates。
- **同 LAN 选路**：本机 netmask 计算同网段，物理 LAN 优先；VPN 排后。
- **可达性探测**：GET /peer/v1/ping，校验 node_id，记录延迟和失败原因。
- **直连优先**：群消息按排序候选发送；失败才中心 fallback。
- **中心附件 fallback**：群图片上传 R2，消息携带 attachments，接收端拉取渲染。
- **聊天页**：后台同步，页面打开 < 0.1s；版本页新增直连节点表。
- **修复**：room_state 只读写入 500、后台同步写锁、重复函数定义。

## 验证

```text
PHP compile                     PASS
peer 6090 ping                  PASS
peer directory sync             PASS
peer status API                 PASS
version page peer table         PASS
center R2 upload + GET          PASS
center message attachments      PASS
redaction/package scan          PASS
```

## 已知边界

```text
同 LAN 不同 VLAN/子网：没有路由时中心 fallback
对称 NAT/CGNAT：无 STUN/ICE/TURN 时中心 fallback
公网 peer endpoint 必须 TLS
旧图片 #217 不会自动补发，需要重新发送
```
