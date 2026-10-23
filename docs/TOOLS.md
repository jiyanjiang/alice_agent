# TOOLS · 工具

## 默认工具

首包默认只展示两个能力：

| id | 类型 | 用途 |
|---|---|---|
| `weather` | tool | 地点天气 + 按衣柜/场景给建议 |
| `research.ask` | workflow | 主题调研七步 |

本地入口：

```text
http://127.0.0.1:6080/app/tools
```

工具市场是广义工具箱：tool 和 workflow 都算，不单独做“工作流页”。

## 工具在哪里运行

- 工具安装、执行和文件留在本机；
- 中心工具市场负责浏览、提交与审核；
- 公开包默认不带私有工具；
- 私有工具下载可选 `--download-token`。

## 新增工具

以本地 `/app/tools` 页展示的命令为准。不要把模型 key、agent key 或私有数据写进工具 manifest。
