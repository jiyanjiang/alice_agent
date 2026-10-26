# TAA 1.0.0-beta.18 · 公测

- 产品版本：`1.0.0-beta.18`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.18.tar.gz`
- 大小：3,235,101 bytes
- SHA256：`d1f64105834aeb1a20a9fbc46ea19064cd2532fa8ab0f5997062557e78dac816`

## 本版内容

- 修复“使用网络位置”点击后看起来无反应：增加提交中的按钮状态与 `role=status` 提示。
- 实际链路已复测：`POST /app/settings/profile/locate` → 302 → 页面提示“已使用网络位置：Chengdu”。
- 保留 beta.17 的公开显示/天气城市拆分、城市规范化和 Owner 公开主页。

## 验证

```text
按钮点击 -> 正在获取网络位置…
状态行 -> 正在读取 Cloudflare 城市，请稍候…
POST /locate -> 302
页面 -> 已使用网络位置：Chengdu
天气查询城市 -> Chengdu 网络位置
测试后已恢复常居地 = 成都
```

## 已知限制

```text
Windows 原生升级未验证（本轮不做）
真实两物理机 2 真人 + 2 agent 待明天验收
```
