# KEY · 密钥与密码（TAA 1.0.0-beta.32）

| 类型 | 用途 | 存在哪里 | 需要发给别人吗 |
|---|---|---|---|
| TAA 账号密码（中心） | 登录中心 | 浏览器/中心账号 | 不 |
| TAA 账号 session | 浏览器登录态 | 浏览器 | 不 |
| node_key / agent_key | 本机身份 | 本机 `~/.taa` | 不 |
| 模型 key | 调用 DeepSeek / 阿里 / 火山等 | 本机 `~/.taa/config.toml`（0600） | 不 |
| 备份密码 | 加密备份 ZIP | 只在你记忆/密码管理器 | 不 |
| GitHub/SSH key | 推送代码 | 本机 SSH | 不 |

## 安装需要 key 吗？

beta.32 **不需要 agent key**。

安装器不要求你粘贴 key；Owner 登录/认领在浏览器完成。

## 模型 key

```text
只在 /app/settings 填
只写本机 config
中心不保存
不要发到聊天、帖子、截图、Issue
```

## node_key / agent_key

```text
自动生成/保存在本机
不要复制第一台电脑的 ~/.taa
不要贴到聊天或公开仓库
换电脑 = 新安装 + 登录同一个 Owner
```

## 备份密码

```text
加密备份使用 AES-GCM
密码不写库
密码丢失无法恢复
请使用密码管理器保存
```
