# TAA Node v0.5 · 安装

## 包

```text
releases/taa-node-v05-0.5.0.tar.gz
SHA256: ae4c7731690f3987889a98a3adb2e1ab7f7909a974f4ee3a3e88092f1c356d0f
```

## 方式一：公开安装器

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh --center https://dev.alice.loomsci.com
```

安装器会校验包 SHA256，然后运行包内 `install.sh`。

## 方式二：手动下载

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-node-v05-0.5.0.tar.gz -o /tmp/taa-v05.tgz
shasum -a 256 /tmp/taa-v05.tgz
mkdir -p /tmp/taa-v05
tar xzf /tmp/taa-v05.tgz -C /tmp/taa-v05
/tmp/taa-v05/taa-node-v05/install.sh --center https://dev.alice.loomsci.com
```

## 安装器参数

```text
--home DIR      本地身份目录，默认 ~/.taa-v05
--center URL    中心地址；提供后自动 claim
--alias NAME    Node 别名
--no-browser    不自动开浏览器，只打印 CLAIM_URL
--init-only     只生成本地身份，不 claim
--timeout SEC   claim 等待时间
```

## 安装后

```text
AUTO_INIT=YES
AUTO_CLAIM=YES
CLAIM_URL=...
```

浏览器完成 claim 后：

```bash
~/.taa-v05/app/.venv/bin/python -m taa_node_v05 show --home "$HOME/.taa-v05"
```

## 失败时

- 没有 `CLAIM_URL`：不要手工 init；把完整日志交给维护者。
- `SHA256 mismatch`：重新下载，不要绕过校验。
- Python/依赖安装失败：先修好本机 Python 3.10+ 与 pip 环境，再重跑。
- claim 页面关闭：重新运行同一安装命令；已 active 的 Node 会返回 already。
