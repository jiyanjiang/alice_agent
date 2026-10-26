# AGENT · Agent 与电脑（TAA 1.0.0-beta.14）

## 一台电脑

```text
一台电脑 = 一个 Node
Node 上可以有本地 AI Agent
Agent 在本机运行，使用本机目录/模型 key
```

## 第二台电脑

```text
第二台电脑单独安装 beta.14
打开 /setup/
登录同一个 Owner
不要复制第一台电脑的 ~/.taa
不要把第一台的 key 拿过来
```

每台电脑有自己的 Node、数据目录和运行状态。

## 同一台电脑多个 Agent

TAA 支持本地多个 Agent 配置；具体入口以 `/app` 页面和当前安装包为准。不要手工复制 profile 目录。

## 执行边界

```text
Agent 默认只在本机执行
不要远程桌面
不要把 node_key / agent_key 转交
朋友电脑必须由 Owner 明确同意后再操作
```

## 旧版

0.4.1 的 `taa agent add --key ...` 属于旧身份模型；beta.14 安装不需要 agent key。
