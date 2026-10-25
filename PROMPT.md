# TAA 1.0.0-beta.1 · IDE 首次使用提示词

把下面整段粘贴到 IDE 的 Agent/终端对话中。

```text
# TAA 1.0.0-beta.1 初始化

请在这台电脑上安装并启动 TAA。不要要求我复制 key，也不要创建第二个 Owner。

## 前提
- 这台电脑已有 Python 3.10+、curl、tar。
- 允许访问：
  - GitHub raw：https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main
  - 公测中心：https://alice.loomsci.com

## 步骤

1. 下载公开安装器：

curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-install.sh

2. 运行安装器。它会创建 ~/.taa/venv、安装运行时、启动本地 Flask：

bash /tmp/taa-install.sh

3. 打开本地入口（如果安装器没有自动打开）：

http://127.0.0.1:6080/app/bridge

首次会进入 /setup/。把页面展示给我，不要自己创建 Owner。

4. 我在浏览器完成 Owner 登录/注册，并把这台电脑加入已有 Owner。
   不要创建第二个 Owner。

5. 检查本地状态：

~/.taa/app/taa status
~/.taa/app/taa open

打开 http://127.0.0.1:6080/app/bridge，确认页面可以进入 /app。

6. 报告：
- 安装是否成功
- 本地 UI 是否可访问
- 是否出现过 key/password 泄露（应为 NO）
- 失败时附完整错误

不要输出 node_key、agent_key、Owner 密码或临时密码。
不要手工 init，不要手工 claim；如果 /setup/ 失败，停止并报告。
```
