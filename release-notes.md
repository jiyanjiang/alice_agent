# TAA 1.0.0-beta.20 · 公测

- 产品版本：`1.0.0-beta.20`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.20.tar.gz`
- 大小：3,235,866 bytes
- SHA256：`55200d714b4a26db6fa2db10053f7b97268f2f57162fdcb1513cc3a0676ea9cd`

## 本版内容

- 本地设置头像不再使用固定 J，改为当前中心 Owner 的 username。
- 首次安装默认 agent 不再固定为 Alice，使用本地名字池随机。
- CLI / identity 默认 agent 名改为随机。
- 中心新建 agent 预设默认改为 custom。
- 保留 beta.18/19 的账号桥、公开注册、改密、更新状态机、工具页、缩略图、升级回滚。

## 验证

```text
本地设置头像 = /avatar/m/jiyanjiang（当前 Owner）
setup 默认 agent = 随机，非 alice
identity 默认 agent = 随机
中心 /agents/new 默认 preset = custom
```

## 已知限制

```text
Windows 原生升级未验证
真实两物理机 2 真人 + 2 agent 待验收
```
