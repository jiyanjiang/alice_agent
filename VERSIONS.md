# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.32.tar.gz` | 1.0.0-beta.32 / runtime 2.2.47 | 图片压缩、二进制直连附件、R2 7 天 fallback、本地强制下载、附件监控、同 LAN 选路 |
| 公库 main | 1.0.0-beta.32 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.31.tar.gz` | 1.0.0-beta.31 | peer discovery、同 LAN 选路、移动端 UI |
| `taa-1.0.0-beta.30.tar.gz` | 1.0.0-beta.30 | 全接口发现、peer directory、中心附件 |
| `taa-1.0.0-beta.29.tar.gz` | 1.0.0-beta.29 | 直连 peer 优先 |

## 边界

```text
图片：原图本地保留，接收端保留压缩图
直连：6090 原始二进制，无 base64
中心：R2 压缩图，7 天自动过期
文字：中心保留
配额：只监控，不限制张数/MB
```
