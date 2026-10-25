# LOGIN · 登录与 Owner 认领（TAA 1.0.0-beta.2）

## 1. 安装后打开

```text
http://127.0.0.1:6080/app/bridge
```

首次会进入 `/setup/`。

## 2. 创建/认领 Owner

```text
1. 创建本地 Owner 用户名 + 密码
2. 连接中心 https://alice.loomsci.com
3. 登录已有 Owner，或注册新 Owner
4. 确认把这台电脑加入 Owner
5. 回到 /app
```

## 3. 原则

```text
每台电脑一个 Node
同一个 Owner 可以有多台电脑
不要创建第二个 Owner
不要复制第一台电脑的 ~/.taa
不要把密码/key 发到聊天
```

## 4. 登录中心

中心地址：

```text
https://alice.loomsci.com
```

中心负责：

```text
Owner 登录
Node/Agent 目录
组与授权
```

不负责：

```text
模型 key 保存
远程完整 /app
大文件中转
```

## 5. 登录失败

```text
不要重复创建 Owner
不要手工初始化数据库
保留错误页面
报告：系统、浏览器、错误文字、时间
```
