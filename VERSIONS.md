# TAA 版本与包边界

## 当前公测

| 制品 | 版本 | 包含 |
|---|---|---|
| `taa-1.0.0-beta.30.tar.gz` | 1.0.0-beta.30 / runtime 2.2.47 | 全接口发现、peer directory、同 LAN 选路、探测、直连优先、中心附件 fallback、后台同步 |
| 公库 main | 1.0.0-beta.30 | installer、包、latest.json、IDE prompt、文档 |

## 历史包

| 制品 | 版本 | 说明 |
|---|---|---|
| `taa-1.0.0-beta.29.tar.gz` | 1.0.0-beta.29 | 直连 peer 优先 |
| `taa-1.0.0-beta.28.tar.gz` | 1.0.0-beta.28 | 异步更新检查 |
| `taa-1.0.0-beta.27.tar.gz` | 1.0.0-beta.27 | 直连 peer 基础 |
| `taa-1.0.0-beta.26.tar.gz` | 1.0.0-beta.26 | 群中心同步、产品版本心跳 |

## 边界

```text
同 LAN 且 6090 可达 → direct
公网/IPv6 可达 endpoint → direct
对称 NAT / CGNAT → center fallback
```
