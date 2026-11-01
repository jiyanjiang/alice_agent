# TROUBLESHOOTING · 常见故障

## 安装前

| 现象 | 处理 |
|---|---|
| 没有 Python | 安装 Python 3.10+；`python3 --version` 确认 |
| 没有 curl / tar | macOS 通常自带；Linux 安装 `curl tar`；Windows 用 WSL2 |
| 网络打不开 GitHub | 检查代理/DNS；公开安装器需要访问 raw GitHub |
| 6080 被占用 | `bash /tmp/taa-install.sh --port 6081` |
| 想换安装路径 | `--home "$HOME/Applications/taa"` 或 `TAA_HOME=...` |

## 安装阶段

| 现象 | 处理 |
|---|---|
| `SHA256 mismatch` | 停止；不要绕过校验；重新下载安装器/包 |
| `Python version` 报错 | 升级 Python 到 3.10–3.13 |
| `ensurepip` / venv 创建失败（常见于 Python 3.14） | 改用 Python 3.12：`TAA_PYTHON=/opt/homebrew/bin/python3.12 bash /tmp/taa-install.sh` |
| 依赖安装失败 | 检查网络和 venv；重跑安装器 |
| 安装器启动失败 | 看 `~/.taa/run/web.log` 最后 30 行 |
| 安装后页面 404 | 确认端口；打开 `/app/bridge` 而不是 `/` |
| 安装后没有 `/setup/` | 先 `taa status`，再访问 `/setup/` |

## 浏览器 / claim

| 现象 | 处理 |
|---|---|
| 浏览器打不开 localhost | 检查 `taa status`、端口、防火墙 |
| 绑定页面白屏 | 重新打开 `/setup/`；不要重复创建 TAA 账号 |
| 登录后仍显示未连接 | 回到 `/setup/` 完成绑定；不要创建第二个 TAA 账号 |
| 页面提示 key | 不要复制/粘贴 key；说明页面和错误 |
| WSL 浏览器打不开 | 浏览器开在 Windows 侧，访问 `http://127.0.0.1:6080`；仍不行则报告 WSL 版本 |

## 数据 / 备份

| 现象 | 处理 |
|---|---|
| 备份导入失败 | 确认 ZIP/加密包完整；密码正确；不要手工改包 |
| 换路径后命令找不到 | 使用 `$TAA_HOME/app/taa`，不要用旧 `~/.taa/app/taa` |
| 想迁移旧电脑 | 新电脑重新安装；通过 `/app/backup` 导出/导入 |
| 误删数据 | 从备份恢复；不要继续写入旧目录 |

## 模型

| 现象 | 处理 |
|---|---|
| 模型 401/403 | 检查本机模型 key、余额、模型权限 |
| 没有模型 key | 安装和本地 UI 仍可用；需要模型的功能会提示配置 |
| 天气地点报错 | 传入城市名；不要空地点 |

## 不要做

```text
不要复制第一台电脑的 ~/.taa 到第二台
不要把 key 填进网页登录框
不要用 --insecure 绕过证书校验
不要把 6080 暴露到公网
不要把 key、密码、私人聊天发到 GitHub Issue
不要跳过 SHA256 校验
```

## 报告问题需要提供

```text
操作系统 + 版本
Python 版本
安装命令
端口
是否 WSL
最后 30 行日志（脱敏）
复现步骤
```

不要上传：

```text
~/.taa 整个目录
*.key
模型 key
TAA 账号密码
私人聊天/附件
```
