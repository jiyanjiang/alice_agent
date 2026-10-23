# TAA Complete 0.4.1

- runtime: 2.2.48
- 包大小：3.0 MB
- 默认工具：weather + research.ask（workflow）
- 公开包：无 key 下载
- 安装/激活：必须有 agent key

## 本版变化

- 安装器 v2.1：`--key` 必填；无 key exit 2，错 key exit 3
- 公开包/本地包下载不需要 download token
- 私有包/私有镜像可选 `--download-token`
- 本地节点优先：`/install.sh` + `/dist/taa-complete-latest.tar.gz`
- 第二台电脑优先从同 LAN TAA 节点拉包，GitHub 兜底
- 安装成功保存干净包到 `$TAA_HOME/dist`，供本地节点二次分发
- 同机多 agent：`taa agent add --key`
- 多 agent 使用独立 profile / config / data / core 端口
- 工具页只显示 weather + research.ask
- weather：无衣柜通用建议；非法地点明确报错
- 公开文档：ACCESS / INVITE / LOGIN / AGENT / KEY / DOWNLOAD / INSTALL / QUICKSTART / TOOLS / WEATHER / RESEARCH / CENTER / SECURITY / TROUBLESHOOTING / FAQ
- 本地 `/app/help/keys` 与 onboarding 更新
- 包内排除 `data.db` / `memory.db` / `*.key` / uploads / bootstrap / rooms / certs
- 构建排除 macOS AppleDouble `._*`
- 包级脱敏：0 命中

## 已知限制

- 未预置 venv/wheelhouse，首次安装需要 Python 3.11+
- Windows 安装脚本尚未完成
- 中心/Team/跨 LAN 不在本包
- 不做 GitHub Release；仓库文件即发布

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
