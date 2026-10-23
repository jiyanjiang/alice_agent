# WEATHER · 天气与穿搭

## 用途

查询地点天气，并结合本人衣柜、性别、场景给出穿搭建议。

## 本地使用

打开：

```text
http://127.0.0.1:6080/app/tools
```

或使用本机 CLI：

```bash
cd ~/.taa/app
python cli/teamai.py weather --as <agent> --at 成都
```

可选：

```text
--days 1..14
--scene commute|outdoor|formal|home|sport
```

## 地点

- 支持城市名，例如 `成都`、`Shanghai`、`Boston`；
- 地点为空时，会提示设置城市或传入地点；
- 非法/找不到地点会明确报错并给示例，不静默返回错误天气。

## 衣柜

- 有衣柜：按本人衣柜推荐；
- 没有衣柜：给通用建议，不假装有私人衣柜数据；
- 衣柜属于私密维度，默认只在本地使用。

## 示例

```bash
python cli/teamai.py weather --as <agent> --at 成都 --scene commute
```
