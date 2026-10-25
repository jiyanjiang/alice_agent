# TAA Node v0.5.1 · 公测

- 版本：`0.5.1`
- 源码提交：`dd63fe8`
- 公测中心：`https://alice.loomsci.com`
- 包大小：约 27 KB（不含 Python 运行时）
- 运行环境：Python 3.10+、`curl`、`tar`；由用户自行准备
- 默认工具：`weather`、`research.ask`

## 本版内容

- Owner → Node → Agent 身份
- 本地 Flask UI
- 中心 claim
- 第二台电脑加入同一 Owner
- X25519 + AES-GCM 加密消息
- bundle export / import / sync
- 一键安装：自动 init；提供 `--center` 时自动 claim
- claim 成功后自动启动本地 Flask 并打开浏览器
- 新增 `taa start / open / status / stop / url`
- 本地 UI 固定入口：`http://127.0.0.1:6099/app`
- 本地 Flask 每 5 秒向中心发心跳
- 中心 Owner 页显示“打开本机 TAA”；最近在线可直达，未在线显示 IDE 启动提示词
- 支持 `?open=1` 自动跳转本地 UI
- 安装器把运行时持久化到 `~/.taa-v05/app`，不会随临时目录清理
- 公开包不含 key / identity / 私有数据

## 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh --center https://alice.loomsci.com
```

## 本地控制

```bash
~/.taa-v05/app/taa open
~/.taa-v05/app/taa status
~/.taa-v05/app/taa stop
```

## 已知限制

- 运行环境由用户自行准备；安装器会创建 `.venv` 并安装 Flask/cryptography。
- Windows 安装器尚未验证。
- 浏览器从公网 HTTPS 直接探测 `127.0.0.1` 会被 PNA 拦截；中心通过本地 Flask 心跳判断在线。
- 不包含中心服务、私有工具或私有数据。

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
