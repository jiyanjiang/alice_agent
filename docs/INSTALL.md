# INSTALL · 安装 TAA 1.0.0-beta.34

本页是详细安装说明，适用于 macOS / Linux / Windows(WSL2)。

## 1. 前置条件

```text
Python 3.10–3.13（推荐 3.12）
curl
tar
可写磁盘空间（建议 ≥1 GB）
可访问 GitHub raw
```

不需要：

```text
agent key
手工创建数据库
手工初始化 Node
第二个端口
```

---

## 2. 默认安装

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
bash /tmp/taa-install.sh
```

如果默认 `python3` 是 3.14，且出现 `ensurepip` / venv 创建失败，改用 Python 3.12：

```bash
TAA_PYTHON=/opt/homebrew/bin/python3.12 \
bash /tmp/taa-install.sh
```

安装器执行：

```text
1. 下载 beta.34 包
2. 校验 SHA256
3. 安装到 ~/.taa/app
4. 创建 ~/.taa/venv
5. 安装 Python 依赖
6. 启动本地 Flask 6080
```

打开：

```text
http://127.0.0.1:6080/app/bridge
```

`/setup/` 由本人完成 TAA 账号创建/登录，并自动绑定本机。不要复制 key，不要创建第二个 TAA 账号。

---

## 3. 自定义安装路径

### 3.1 `--home`

```bash
bash /tmp/taa-install.sh --home "$HOME/Applications/taa"
```

目录：

```text
$HOME/Applications/taa/app
$HOME/Applications/taa/venv
$HOME/Applications/taa/run
```

### 3.2 `TAA_HOME`

```bash
TAA_HOME="$HOME/Applications/taa" bash /tmp/taa-install.sh
```

### 3.3 路径规则

```text
必须是可写目录
建议使用绝对路径
beta 不保证带空格/中文路径
不要用 /tmp（重启会丢）
不要用 /opt（权限复杂）
Windows 用 WSL2 的 /home/<user>/taa
```

---

## 4. 端口

默认 `6080`。

如果被占用：

```bash
bash /tmp/taa-install.sh --port 6081
```

访问：

```text
http://127.0.0.1:6081/app/bridge
```

自定义路径 + 端口：

```bash
bash /tmp/taa-install.sh --home "$HOME/Applications/taa" --port 6081
```

---

## 5. Windows / WSL2

```text
1. 安装 WSL2 + Ubuntu
2. 在 Ubuntu 终端运行安装器
3. 浏览器在 Windows 侧打开 http://127.0.0.1:6080/app/bridge
```

不要把安装目录放在 `/mnt/c`（性能与权限都不稳）。
Windows 原生（非 WSL）未专门验证。

---

## 6. 安装后自检

### 6.1 状态

```bash
~/.taa/app/taa status
```

### 6.2 本地页面

```bash
curl -fsS http://127.0.0.1:6080/app/chats | head
```

### 6.3 控制命令

```bash
~/.taa/app/taa open
~/.taa/app/taa status
~/.taa/app/taa stop
```

自定义路径：

```bash
"$HOME/Applications/taa/app/taa" status
```

---

## 7. 退出码与失败处理

```text
0  成功
2  参数错误（如未知参数）
3  Python / 依赖前置不满足
4  包 SHA256 不匹配或包结构异常
1  启动失败（查看 ~/.taa/run/web.log）
```

失败时不要：

```text
不要跳过 SHA256
不要手工改包
不要创建第二个 TAA 账号
不要把 key/密码贴到聊天
```

报告时附：

```text
系统版本
Python 版本
安装命令
最后 30 行日志
```

日志：

```text
~/.taa/run/web.log
```

---

## 8. 升级

先备份/停止：

```bash
~/.taa/app/taa stop
```

重新运行安装器。默认会更新运行时代码；数据目录不会主动删除。

---

## 9. 回滚 beta.2

```bash
TAA_VERSION=1.0.0-beta.2 \
TAA_PACKAGE_SHA256=74157fd4ea492dd4583a53794fd6178d690265a135bc1ac5c97ac2bdc1c455de \
bash /tmp/taa-install.sh
```

---

## 10. 卸载

```bash
~/.taa/app/taa stop
rm -rf ~/.taa
```

自定义路径：

```bash
"$HOME/Applications/taa/app/taa" stop
rm -rf "$HOME/Applications/taa"
```

删除前确认备份；不要删除他人的 `~/.taa`。
