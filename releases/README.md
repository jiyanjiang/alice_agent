# 发布物边界

## 当前产品主包

```text
taa-1.0.0-beta.1.tar.gz
完整 TAA 产品包
```

## 历史完整包 / 回滚

```text
taa-complete-0.4.1.tar.gz
legacy complete 0.4.1
```

## 内部身份模块（不是完整产品）

```text
taa-node-v05-0.5.0.tar.gz
taa-node-v05-0.5.1.tar.gz
```

`taa-node-v05-*` 只有约 25–27 KiB，包含 Node/Owner/Agent 身份、claim 与 bridge 的模块，**不是完整 TAA 产品包**。保留它们只用于旧节点/回滚，不再作为公测主入口。

不要把 `taa-node-v05-*` 当成“完整安装包”发布或推荐给新用户。
