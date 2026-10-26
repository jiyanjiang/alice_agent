# SECURITY · 安全边界（TAA 1.0.0-beta.10）

## 本机

```text
TAA 默认只服务本机 http://127.0.0.1:6080
不要把 6080 暴露到公网
不要把 ~/.taa 上传到公开仓库
不要在公共电脑保存 Owner 密码
```

## 密钥

```text
安装 beta.10 不需要 agent key
模型 key 只存本机 ~/.taa/config.toml（0600）
node_key / agent_key 只在本机
不要发到聊天、帖子、截图、Issue
```

## P2P

```text
beta.10 默认要求远端事件签名（TAA_PEER_REQUIRE_SIGN=1）
附件按 sha256 校验
缺失附件不推进同步游标
授权按组/房间 allowlist
```

## 备份

```text
明文 ZIP：不要外传
加密包：AES-GCM，密码不写库
密码丢失无法恢复
```

## 问题反馈

可以附：

```text
系统版本、Python 版本、安装命令、错误日志（脱敏）
```

不要附：

```text
~/.taa 整个目录
*.key
模型 key
Owner 密码
私人聊天/附件
```

## 中心

```text
中心不保存模型 key
中心不代替节点执行任务
中心通知端点未进入 beta.10
```

详见 [CENTER](CENTER.md)。
