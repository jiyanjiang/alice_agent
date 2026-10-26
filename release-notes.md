# TAA 1.0.0-beta.17 · 公测

- 产品版本：`1.0.0-beta.17`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.17.tar.gz`
- 大小：3,234,883 bytes
- SHA256：`ac07645a9fa650f4abc1c719d672a6311710b713e0e37cdfef15d2c7c65ed2d8`

## 本版内容

- 公开主页常居地增加“使用网络位置”（Cloudflare `/geo/suggest`）。
- 点击后自动保存城市级地点，立即回到公开主页。
- 公开显示地点和天气查询城市拆分：
  - `home_location` 可自由填写、可写错、可包含区县
  - `weather_city` 只存城市级，天气只用它
- `成都·武侯` / `成都市武侯区` / `四川省成都市武侯区` → 天气使用 `成都`
- 手动保存成功后，若可解析出城市，同步更新本机天气城市。
- 天气地点顺序：显式地点 → persona.residence → owner weather_city → CF。
- 继续保留 beta.16 的公开主页四栏编辑页、settings 入口、setup 兼容重定向。

## 验证

```text
/app/settings/profile 200
常居地 [成都] [使用网络位置]
天气查询城市：成都
QR 本地生成
成都·武侯 → 成都
成都市武侯区 → 成都
四川省成都市武侯区 → 成都
Chengdu, Sichuan → Chengdu
武侯区 → 空（不作为天气城市）
无法解析的显示文本不阻断保存
1600 / 390 无横向滚动
```

## 已知限制

```text
Windows 原生升级未验证（本轮不做）
真实两物理机 2 真人 + 2 agent 待明天验收
```
