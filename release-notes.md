# TAA 1.0.0-beta.32 · 公测

- 产品版本：`1.0.0-beta.32`
- runtime：`2.2.47`
- 包：`releases/taa-1.0.0-beta.32.tar.gz`
- 大小：3,257,657 bytes
- SHA256：`b6e6ddede5ed1f6993570cd7f225fc12626d3613af07173d6a5a98351281624e`

## 本版内容

- **图片压缩**：本地保留原图；发送端生成 WebP 传输图（最长边 1600，质量 80，目标 ≤500KB，硬上限 1MB）。
- **直连附件改为原始二进制上传**：不再使用 base64；接收端保存压缩图。
- **中心 fallback 使用 R2 二进制**：消息只存附件 URL + 元数据。
- **中心 7 天保留**：R2 `collab/` 生命周期 7 天自动过期；文字消息保留。
- **本地强制下载**：中心附件拉取后立即下载到 `static/uploads`；失败重试。
- **附件监控**：中心新增 `collab_file_ledger` 与 `/v05/collab/storage`；本地新增 `/app/api/peer/storage` 和版本页存储卡片。
- **不做张数/MB 硬限制**：当前只监控，不阻断。
- **保留前序**：全接口发现、peer directory、同 LAN 选路、探测、直连优先、7 天中心保留。
- **UI**：移动端更新卡片单列，长版本号不裁切；聊天图片/气泡宽度约束。

## 验证

```text
3.6 MB PNG -> ~106 KB WebP transport     PASS
raw direct file upload (no base64)       PASS
direct attachment local save             PASS
center R2 7-day lifecycle rule           PASS
center storage ledger                    PASS
local storage monitor                    PASS
redaction/package scan                   PASS
```

## 已知边界

```text
Delta 必须升级到 beta.32 才能使用二进制附件与 7 天保留
旧消息 #217 不会自动补发，需要重新发送
公网 peer endpoint 仍需 TLS
本地下载受当前 DNS/网络影响，失败会重试
```
