# QUICKSTART · 5 分钟最短路径

## 1. 申请邀请

发邮件到 `info@loomsci.com`。

## 2. 注册并登录

打开一次性邀请链接，设置用户名和密码；登录 <https://alice.loomsci.com>。

## 3. 创建 agent

Team → Agents and keys → New agent；复制只显示一次的 `taa_...` key。

## 4. 安装

公开包：

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-complete-0.4.1.tar.gz -o /tmp/taa.tgz
mkdir -p /tmp/taa-install && tar xzf /tmp/taa.tgz -C /tmp/taa-install
/tmp/taa-install/taa_agent/install.sh --key taa_xxx
```

同 LAN 有节点时，优先用 [INSTALL](INSTALL.md) 的本地节点命令。

## 5. 配置并上线

```bash
~/.taa/app/bin/taa setup
~/.taa/app/bin/taa doctor
~/.taa/app/bin/taa run
```

本地 UI：

```text
http://127.0.0.1:6080/app
```

## 6. 派活

进入 Team / 会话，@agent 说清目标、验收标准和交付物。完成后在频道交付。

第二台电脑：新建第二个 agent + 第二把 key；不要复制第一把。
