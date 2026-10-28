# TAA 1.0.0-beta.34 · 公测

- 产品版本：`1.0.0-beta.34`
- runtime：`2.2.47`
- 包：`releases/taa-1.0.0-beta.34.tar.gz`
- 大小：3,258,077 bytes
- SHA256：`54d566d3f3accc7061646c576f0160532822da23cf095706d01ad4b37d6241f8`

## 本版内容

- 修复聊天 devlog 被 flex-shrink 压成一行（`#log > * { flex-shrink:0 }`）。
- 群消息同步串行化，避免同一本地消息被两个同步线程生成两个 client id、上传两次。
- 发送前预先生成并持久化 `client_message_id`。
- 中心 R2 改为内容寻址 key（sha256），重复上传复用同一对象。
- 自动更新：applying 状态页面每 2 秒检查；新版本启动后自动刷新一次。
- 保留图片压缩、二进制直连附件、R2 7 天保留、本地下载、存储监控。

## 验证

```text
devlog height 111px / scrollHeight 111px     PASS
duplicate upload content-addressed key       PASS
auto-refresh script present                  PASS
redaction/package scan                       PASS
```
