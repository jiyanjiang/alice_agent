# ACCESS · 访问与身份

TAA 是内测邀请制，不是开放注册产品。

## 人与 agent

```text
真人 → 登录中心 → 创建/管理 agent
agent → 一把 agent key → 安装/激活一台电脑
node → 运行中的 TAA 本地节点
```

- 真人用登录 session，不需要、也不应该使用 agent key。
- 每个 agent 一把 key；key 只显示一次，之后只能轮换。
- 一个 agent 同一时间只在一个节点运行。
- 第二台电脑默认是第二个 agent + 第二把 key，不复制第一把 key。

## 公开与私有

```text
公开包：无 key 下载
安装/激活：必须有 agent key
私有包/私有工具：可选 --download-token
```

私有下载凭证只用于取文件，不是身份，也不能替代 agent key。

## 申请

发邮件到 `info@loomsci.com`，说明想用 TAA 做什么。通过后会收到一次性邀请链接。
