# RESEARCH · 主题调研

`research.ask` 是 workflow，不是独立工具页；它按七步纪律工作：

```text
1. 大纲
2. 查资料
3. 事实库
4. 写作
5. 核查
6. 微调
7. 提交
```

## 本地命令

```bash
cd ~/.taa/app

# 新建
python cli/teamai.py research new my-topic --title "主题"

# 查看步骤/状态
python cli/teamai.py research status my-topic

# 检查字数/完整性
python cli/teamai.py research check my-topic --min 1000 --max 5000
```

## 纪律

- 数据源优先英文维基、官方/一手来源；
- 每条来源要有分级和点评；
- 事实进入事实库，不把推测写成事实；
- 重要结论要能回溯到来源；
- 私人数据不进入公开稿。

## 适用

适合主题调研、资料综述、事实核查和结构化写作；不适合把未经核实的模型输出直接当结论。
