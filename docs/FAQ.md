# FAQ · 常见问题

## 安装

**需要 agent key 吗？**
不需要。TAA 1.0.0-beta.28 安装不要求 agent key；TAA 账号在 `/setup/` 浏览器完成创建/登录。

**一个 key 可以装两台电脑吗？**
不需要复制 key。每台电脑安装一次，登录同一个 TAA 账号；不要复制 `~/.taa`。

**安装到哪里？**
默认 `~/.taa`。`~` 是当前用户 Home（macOS `/Users/<用户>`，Linux/WSL `/home/<用户>`），不是系统根目录 `/`。

**可以自定义路径吗？**
可以：

```bash
bash /tmp/taa-install.sh --home "$HOME/Applications/taa"
```

或：

```bash
TAA_HOME="$HOME/Applications/taa" bash /tmp/taa-install.sh
```

**支持 Windows 吗？**
推荐 WSL2 / Ubuntu。Windows 原生未专门验证。不要把安装目录放在 `/mnt/c`。

**端口 6080 被占用怎么办？**
用：

```bash
bash /tmp/taa-install.sh --port 6081
```

然后访问 `http://127.0.0.1:6081/app/bridge`。

**安装失败怎么办？**
看 [TROUBLESHOOTING](TROUBLESHOOTING.md)。报告系统、Python 版本、安装命令、最后 30 行日志。

---

## 账号

**需要先申请邀请吗？**
beta.28 公测安装不要求 agent key。TAA 账号创建/登录以 `/setup/` 页面为准。

**可以创建第二个 TAA 账号吗？**
不建议。每台电脑登录已有 TAA 账号，不要重复创建。

**第二台电脑怎么办？**
第二台电脑单独安装，登录同一个 TAA 账号；不要复制第一台 `~/.taa`。

**密码 / key 会发到哪里？**
不要发到聊天、帖子、截图或公开仓库。模型 key 只存本机。

---

## 模型 Key

**模型 key 和登录密码一样吗？**
不一样。登录密码用于 TAA 账号；模型 key 用于调用模型。

**中心会保存模型 key 吗？**
不会。模型 key 只存本机 `~/.taa/config.toml`（0600）。

**没有模型 key 能用吗？**
可以安装、打开 `/app`、使用部分本地功能；需要模型的能力会提示配置。weather 无 key 有文字模式。

---

## 数据 / 备份

**数据在哪里？**
默认在 `~/.taa`。自定义路径则在对应 `$TAA_HOME`。

**怎么备份？**
打开 `/app/backup`：

```text
下载明文 ZIP
下载加密包（推荐）
保存到本机并轮换
```

加密包密码不要丢；明文备份不要外传。

**可以换电脑吗？**
新电脑重新安装并登录同一个 TAA 账号。不要直接复制 `~/.taa`（venv 路径可能失效）。

---

## P2P / 通知

**P2P 内容会经过中心吗？**
TAA 设计为帖子、聊天、附件内容优先在本地/P2P；中心负责身份、目录、组/授权等轻量信息。

**审批通知会跨机送达吗？**
beta.28 只在目标机器的本地 `/app/inbox` 显示待办。中心通知端点未进入 beta.28，后续版本再做。

**P2P 附件会校验吗？**
会。附件按 sha256 校验；缺失附件不会推进同步游标。

---

## 安全

**需要把 6080 暴露到公网吗？**
不需要，也不建议。默认只在本机访问。

**可以把 key 发到 GitHub Issue 吗？**
绝对不要。Issue 只附系统、版本、脱敏后的错误日志。

**明文备份可以发人吗？**
不建议。请使用加密包；密码通过安全渠道单独传递。

---

## 版本

**beta.28 是正式版吗？**
不是。它是公开测试包，功能范围和已知限制见 [../release-notes.md](../release-notes.md)。

**怎么回滚？**
见 [INSTALL](INSTALL.md) 的 beta.2 回滚命令。
