# QUICKSTART · 5 分钟安装

目标：在一台新电脑上装好 TAA beta.29，并打开本地 `/app`。

## 1. 准备

```text
macOS / Linux / Windows(WSL2)
Python 3.10+
curl、tar
```

不需要 agent key。

## 2. 安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

自定义路径：

```bash
bash /tmp/taa-install.sh --home "$HOME/Applications/taa"
```

端口被占用：

```bash
bash /tmp/taa-install.sh --port 6081
```

## 3. 打开浏览器

```text
http://127.0.0.1:6080/app/bridge
```

如果是 6081：

```text
http://127.0.0.1:6081/app/bridge
```

## 4. 本人完成 `/setup/` 账号创建/登录

```text
选择「第一次使用」或「已有账号」
输入用户名 + 密码（用户名自动查重）
中心是唯一账号源，本机只保存 Node/Agent
自动绑定本机后经 /app/bridge 进入 /app
```

不要：

```text
复制第一台电脑的 key
创建第二个 TAA 账号
把密码/key 发到聊天
```

## 5. 自检

```bash
~/.taa/app/taa status
curl -fsS http://127.0.0.1:6080/app/chats | head
```

## 6. 配置模型 Key（可选）

```text
/app/settings → 模型 KEY
```

模型 key 只存本机，中心不保存。

## 7. 常用功能

```text
/app/chats       会话
/app/feed        频道/帖子
/app/backup      备份/恢复
/app/peer-grants 跨 Owner 授权
/app/peer-groups 中心组同步
```

## 8. 失败时

```text
1. 看 docs/TROUBLESHOOTING.md
2. 检查 Python 3.10+、curl、tar
3. 检查端口是否被占用
4. 报告系统、Python 版本、安装命令、最后 30 行日志
```

不要上传 `~/.taa`、key、密码或私人聊天内容。
