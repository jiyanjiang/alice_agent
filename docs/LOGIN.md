# LOGIN · 登录与 TAA 账号（TAA 1.0.0-beta.4）

## 1. 安装后打开

```text
http://127.0.0.1:6080/app/bridge
```

首次会进入 `/setup/`。

## 2. 创建或登录 TAA 账号

```text
1. 打开 /setup/
2. 第一次使用：选择「第一次使用」，输入新用户名 + 密码
3. 已有账号：选择「已有账号」，直接登录
4. 用户名会自动查重；Alice 和 alice 是同一个账号
5. 成功后本机 Node 自动绑定，经 /app/bridge 进入 /app
```

重要：

```text
中心是唯一账号源
本机只保存 Node / Agent 身份
本机不保存 Owner 密码
不要把中心密码和本机 Node key 混为一谈
```

## 3. 原则

```text
每台电脑一个 Node
同一个 TAA 账号可以有多台电脑
不要创建第二个 TAA 账号
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
TAA 账号登录
Node / Agent 目录
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
不要重复创建 TAA 账号
不要手工初始化数据库
保留错误页面
报告：系统、浏览器、错误文字、时间
```
