# TAA Complete 0.4.1

- runtime: 2.2.48
- 包大小：3.0 MB
- 默认工具：weather + research（workflow）

## 本版变化

- 构建脚本支持完整发布树 `alice/taa/node`
- `runtime/` 执行器代码进包
- 版本统一：TAA Complete 0.4.1 / runtime 2.2.48
- 工具页只显示 weather + research
- 移除 LoomDoc 和未充分测试的 alice.calendar
- `TAA_HOME` 隔离修复：不再误读真实 `~/.taa/tools`
- weather：无衣柜时返回通用建议；非法地点明确报错
- 包级脱敏：0 命中

## 已知限制

- 依赖安装未在本包内预置 venv/wheelhouse，首次安装需要 Python 3.11+
- Windows 安装脚本尚未完成
- 中心/Team/跨 LAN 不在本包
