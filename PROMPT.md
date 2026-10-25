# TAA Node v0.5 · IDE 首次使用提示词

把下面整段粘贴到 IDE 的 Agent/终端对话中。

```text
# TAA Node v0.5 初始化

请在这台电脑上安装并启动 TAA Node v0.5。不要要求我复制 key，也不要创建第二个 Owner。

## 前提
- 这台电脑已有 Python 3.10+ 和 curl。
- 允许访问：
  - GitHub raw：https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main
  - 公测中心：https://alice.loomsci.com

## 步骤

1. 下载公开安装器：

curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh

2. 运行安装器。它会自动创建本地身份；提供中心后会自动启动 claim：

bash /tmp/taa-v05-install.sh --center https://alice.loomsci.com

3. 安装器会输出 AUTO_INIT=YES、AUTO_CLAIM=YES 和 CLAIM_URL。
   把 CLAIM_URL 原样展示给我；不要自己创建 Owner，不要打印任何 key 或密码。

4. 我在浏览器完成 Owner 登录/注册并确认这台电脑后，等待安装器退出。

5. 检查本地状态：

~/.taa-v05/app/taa status

确认：
- node_status = active
- center.owner_id 非空
- agents 非空

6. 启动本地 UI：

~/.taa-v05/app/taa open

打开 http://127.0.0.1:6099/app ，确认页面显示已连接和 active。

7. 报告：
- 安装是否成功
- node_id
- node_status
- center.owner_id
- agent_id
- 本地 UI 是否可访问
- 是否出现过 key/password 泄露（应为 NO）

不要输出 node_key、agent_key、Owner 密码或临时密码。
如果 CLAIM_URL 没有出现，停止并报告完整错误；不要手工 init 或手工 claim。
```
