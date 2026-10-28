# TAA 1.0.0-beta.33 · 公测

- 产品版本：`1.0.0-beta.33`
- runtime：`2.2.47`
- 包：`releases/taa-1.0.0-beta.33.tar.gz`
- 大小：3,257,725 bytes
- SHA256：`33a14dd51c8274770de7a4c6fdb9a6917650d65e25bbdfc2fce84b405c74fdf6`

## 本版内容

- 修复聊天记录 flex 布局：消息/devlog 被 flex-shrink 压到 20px，导致自动“收到”信息只显示一行。
- `#log > *` 禁止收缩；devlog 完整高度恢复。
- 保留 beta.32 的图片压缩、二进制直连附件、中心 R2 7 天保留、本地下载和存储监控。

## 验证

```text
devlog height 111px, scrollHeight 111px   PASS
document.scrollWidth == innerWidth         PASS
group dialog mouse open/close              PASS
redaction/package scan                     PASS
```
