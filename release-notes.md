# TAA 1.0.0-beta.19 · 公测

- 产品版本：`1.0.0-beta.19`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.19.tar.gz`
- 大小：3,235,570 bytes
- SHA256：`00afaf49c1fbd76fc69461bf07b9b20ee1f6aa86b6da2f6c4b28543775081ae1`

## 本版内容

- 本地设置头像不再写死 `jiyanjiang`/`J`，改为当前 human id。
- 首次安装的默认 agent 不再固定为 `alice`，从本地名字池随机。
- CLI/identity 默认 agent 名改为随机；仍可手填。
- 中心新建 agent 的预设默认改为 `custom`，不再视觉上默认 Alice。
- 保留 beta.18 的账号桥、公开注册、改密、更新状态机、工具页、缩略图、升级回滚。

## 验证

```text
本地 setup 默认 agent = 随机名字，非 alice
identity 默认 agent = 随机名字
CLI 默认 agent = 随机名字
本地设置头像使用当前 human
中心 /agents/new 默认 preset=custom
```

## 已知限制

```text
Windows 原生升级未验证
真实两物理机 2 真人 + 2 agent 待验收
```
