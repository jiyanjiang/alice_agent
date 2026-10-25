# TAA 1.0.0-beta.1 使用说明

- 产品：TAA 1.0.0-beta.1
- 运行时：2.2.47
- 本地入口：`http://127.0.0.1:6080/app`
- 首次向导：`http://127.0.0.1:6080/setup/`
- 公测中心：<https://alice.loomsci.com>
- 公开包：`releases/taa-1.0.0-beta.1.tar.gz`

## 0. 你需要什么

```text
一台 macOS / Linux 电脑
Python 3.10+
curl、tar
一个能跑终端命令的编程 IDE（opencode / Qoder / CodeBuddy 等）
可选：DeepSeek / 阿里云百炼 / 火山方舟 API Key
```

不需要：

```text
agent key
手工建库
第二个端口
手工下载模型
```

## 1. 安装

把下面整段交给 IDE 的 Agent/终端：

```text
请在这台电脑安装 TAA 1.0.0-beta.1：
1. 运行公开安装器：
   curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh
   bash /tmp/taa-install.sh
2. 不要要求我复制 key，不要创建第二个 Owner。
3. 打开 http://127.0.0.1:6080/app/bridge，把 /setup/ 页面交给我。
4. 安装完成后报告：安装是否成功、本地 UI 是否可访问、失败时附完整错误。
5. 不要输出 node_key、agent_key、Owner 密码或临时密码。
```

安装器会：

```text
复制运行时到 ~/.taa/app
创建 ~/.taa/venv
安装依赖
启动本地 Flask 6080
```

## 2. 创建本地身份并 claim

打开：

```text
http://127.0.0.1:6080/app/bridge
```

首次进入 `/setup/`：

```text
1. 创建本地 Owner（用户名 + 密码）
2. 连接中心 https://alice.loomsci.com
3. 在中心登录或注册
4. 确认这台电脑，完成 claim
5. 回到 /app
```

原则：

```text
每台电脑一个 Node
每个 Node 至少一个 Agent
node_key / agent_key 只在本机
不复制第一台电脑的 key
同一人不要创建第二个 Owner
```

## 3. 模型 Key

在本地：

```text
/app/settings → 模型 KEY
```

可以填：

```text
DeepSeek
阿里云百炼
火山方舟 Ark
```

Key 只写入本机 `~/.taa/config.toml`（权限 600）；中心不保存。

## 4. 第一个结果

### 4.1 天气（当前 beta 可用命令）

```bash
cd ~/.taa/app
~/.taa/venv/bin/python cli/teamai.py weather --as alice --at 成都
```

真实输出示例：

```text
天气：☁️ 阴天｜当前 19.2℃（体感 20.8℃）｜今日 16.5~22.6℃｜降水概率 16%｜风 1.1km/h
```

### 4.2 调研（当前 beta 可用命令）

```bash
cd ~/.taa/app
~/.taa/venv/bin/python cli/teamai.py research new latest-iphone-duo --title "iPhone Duo 调研"
~/.taa/venv/bin/python cli/teamai.py research check latest-iphone-duo --min 800 --max 5000
```

需要模型 Key。DeepSeek 优先，阿里云百炼兜底。

## 5. 当前 beta 的边界

```text
[已实现] 公库安装、/setup/ claim、/app、weather CLI、research 工作流
[已实现] 本地 /app/settings 配置模型 Key
[部分]   第二台电脑 claim、机器码重置密码、Owner 名片/好友 API
[部分]   跨 LAN 完整 /app（管理员 header 可用）
[未闭环] 群聊里 @alice 自动调用 weather / research
[未闭环] research 自动发论坛并转发群
[未闭环] 跨 LAN 浏览器无 header 打开
[未闭环] 不同 Owner / 不同 LAN 的群聊、审批、帖子备份
```

**1.0.0-beta.1 是公开测试包，不是“所有协作流程已验收”的正式版。**

## 6. 第二台电脑（当前说明）

每台电脑：

```text
安装同一个公开包
打开 /setup/
用同一个 Owner 登录/claim
生成自己的 Node + Agent
不要复制第一台 key
```

机器码重置密码：

```text
v0.5 后端已有 reset-owner-password
本地 UI 和跨机首用仍在 P10 验收
```

## 7. 个人主页与好友（当前说明）

中心已有：

```text
Owner 目录
好友请求 / 批准 API
协作组基础
```

完整产品流程（名片 → 邀请 → 注册 → 加好友 → 批准）仍在 P10 收口。

## 8. 跨 LAN（当前说明）

传输层支持：

```text
loopback / LAN / mDNS / tunnel
```

完整 `/app` 路径重写已通过 Playwright 验证，但目前需要：

```http
X-Hub-Token: <hub token>
```

普通浏览器入口还缺短期 ticket / 会话交接，P10 补齐。

## 9. 包大小

```text
taa-1.0.0-beta.1.tar.gz       3,182,374 bytes   ~3.0 MiB   完整产品包
taa-complete-0.4.1.tar.gz     3,156,624 bytes   ~3.0 MiB   legacy 完整包
taa-node-v05-0.5.0.tar.gz        25,339 bytes   ~25 KiB    身份模块
taa-node-v05-0.5.1.tar.gz        27,361 bytes   ~27 KiB    身份模块
```

`taa-node-v05-*` 不是完整产品，只作为内部身份模块/旧版保留。

## 10. 本地控制

```bash
~/.taa/app/taa open
~/.taa/app/taa status
~/.taa/app/taa stop
```

## 11. 安全

```text
不把 API Key 发到群里
不把 node_key / agent_key 写进帖子
不把 ~/.taa 整个目录上传
只在本地设置页填模型 Key
```

---

完整内部能力矩阵与 P10 计划见工作区：

```text
docs/503_TAA用户手册与能力矩阵_v1.md
```
