# TAA 1.0.0-beta.16 · AI IDE 安装提示词

复制下面整段给 IDE 的 Agent（opencode / Qoder / Cursor / Codex / Claude Code 等）。

## 主提示词（默认路径）

```text
请在本机安装 TAA 1.0.0-beta.16 公测包。

先检测系统：macOS / Linux / Windows。
- macOS / Linux：使用系统 shell。
- Windows：使用 WSL2（Ubuntu）或 Git Bash；不要用 cmd.exe 执行 bash 脚本。

要求：
1. 检查 Python 3.10–3.13（推荐 3.12）、curl、tar。
   如果默认 python3 是 3.14 且 venv/ensurepip 失败：
   TAA_PYTHON=/opt/homebrew/bin/python3.12 bash /tmp/taa-install.sh
2. 运行：
   curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
   bash /tmp/taa-install.sh
3. 安装后打开：
   http://127.0.0.1:6080/app/bridge
   把 /setup/ 页面留给我本人完成 TAA 账号创建/登录。
4. 不要要求我复制 node_key / agent_key。
5. 不要创建第二个 TAA 账号。
6. 不要在聊天、日志、截图里输出任何 key、密码、内网地址。
7. 不要把 6080 暴露到公网。
8. 如果 SHA256 不匹配、安装失败或 6080 被占用：
   停止并报告完整错误；不要跳过校验。
9. 如果 6080 被占用：
   bash /tmp/taa-install.sh --port 6081
   然后访问 http://127.0.0.1:6081/app/bridge。
10. 安装后自检：
    ~/.taa/app/taa status
    curl -fsS http://127.0.0.1:6080/app/chats | head
    报告系统、Python 版本、安装结果、本地 URL、失败时最后 30 行日志。
11. 如果 IDE 没有终端执行权限，只输出命令和步骤，不要假装已安装。
```

## 自定义路径

```text
请把 TAA 1.0.0-beta.16 安装到 $HOME/Applications/taa：

curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh --home "$HOME/Applications/taa"

安装后打开 http://127.0.0.1:6080/app/bridge
并按页面提示完成注册和使用。

要求：
- 不复制 key、不创建第二个 TAA 账号；
- 不输出密码/key；
- 安装后执行：
  "$HOME/Applications/taa/app/taa" status
- 失败时报告完整错误，不要跳过 SHA256。
```

## 最短提示词

```text
请在本机安装 TAA 1.0.0-beta.16 公测包：

curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh && bash /tmp/taa-install.sh

安装后打开 http://127.0.0.1:6080/app/bridge
并按提示完成注册和使用。

不复制 key；不创建第二个 TAA 账号；不输出密码/key；失败时停止并报告完整错误。
```

## 真人操作

```text
1. 把提示词粘贴给 IDE Agent。
2. 浏览器打开 http://127.0.0.1:6080/app/bridge
3. 在 /setup/ 完成 TAA 账号创建/登录；用户名自动查重，且不区分大小写。
4. 回到 IDE/终端，让 Agent 执行 taa status。
```

## 安全红线

```text
不要把 node_key / agent_key / 密码贴到聊天
不要把 ~/.taa 上传到公开仓库
不要把 6080 暴露到公网
不要跳过 SHA256
不要用第三方不明安装包
```
