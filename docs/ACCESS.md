# ACCESS · 访问与身份（TAA 1.0.0-beta.17）

TAA 公测包安装**不需要 agent key**。

## 角色

```text
TAA 账号（中心 Owner）   真人账号，登录中心，管理自己的电脑/团队
Node    一台运行 TAA 的电脑
Agent   本机运行的 AI 角色
```

## 首次安装

```text
1. 安装公开包
2. 打开 /setup/
3. 创建/登录 TAA 账号
4. 自动把本机作为一个 Node 绑定到账号
5. 经 /app/bridge 进入 /app
```

原则：

```text
每台电脑一个 Node
同一个 Owner 可以有多台电脑
不要复制第一台电脑的 ~/.taa
不要创建第二个 TAA 账号
```

## 公开包与 key

```text
公开包：直接下载，无 key
安装：不需要 agent key
模型 key：只存在本机，中心不保存
node_key / agent_key：本机身份，不对外发送
```

## 旧版

`TAA Complete 0.4.1` 的 agent-key 安装模型已不属于 beta.17；旧文档只作历史参考。
