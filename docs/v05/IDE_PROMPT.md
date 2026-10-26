> **历史文档（v0.5 早期）**：beta.7 已取消本地 Owner，账号只由中心管理；当前流程以 `../LOGIN.md` 为准。

# TAA Node v0.5 · IDE 提示词

完整提示词见仓库根目录 [`PROMPT.md`](../../PROMPT.md)。核心步骤如下：

```text
1. 下载公开 install.sh
2. 运行 --center https://alice.loomsci.com
3. 把 CLAIM_URL 展示给用户
4. 用户浏览器登录/注册 Owner 并确认电脑
5. show 检查 active + center.owner_id
6. 启动本地 UI http://127.0.0.1:6099/app
7. 只报告非敏感状态
```

约束：

```text
不复制 key
不创建第二个 Owner
不输出 node_key / agent_key / 密码
没有 CLAIM_URL 就停止并报告日志
```
