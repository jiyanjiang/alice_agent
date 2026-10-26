> **历史文档（v0.5 早期）**：beta.5 已取消本地 Owner，账号只由中心管理；当前流程以 `../LOGIN.md` 为准。

# TAA Node v0.5 · 安装

## 包

```text
releases/taa-node-v05-0.5.1.tar.gz
SHA256: 9ea83e754e5b835678e4e35535624ffc0792f0dddb19c2f10bc427c126a2ffe2
```

## 方式一：公开安装器

```bash
curl -fsSL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/install.sh -o /tmp/taa-v05-install.sh
bash /tmp/taa-v05-install.sh --center https://alice.loomsci.com
```

安装器会校验包 SHA256，然后运行包内 `install.sh`。

## 方式二：手动下载

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-node-v05-0.5.1.tar.gz -o /tmp/taa-v05.tgz
shasum -a 256 /tmp/taa-v05.tgz
mkdir -p /tmp/taa-v05 "$HOME/.taa-v05/app"
tar xzf /tmp/taa-v05.tgz -C /tmp/taa-v05
cp -R /tmp/taa-v05/taa-node-v05/. "$HOME/.taa-v05/app/"
"$HOME/.taa-v05/app/install.sh" --center https://alice.loomsci.com
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

浏览器完成 claim 后安装器会自动启动本地 UI 并打开浏览器。手动检查：

```bash
~/.taa-v05/app/taa status
~/.taa-v05/app/taa open
```

## 失败时

- 没有 `CLAIM_URL`：不要手工 init；把完整日志交给维护者。
- `SHA256 mismatch`：重新下载，不要绕过校验。
- Python/依赖安装失败：先修好本机 Python 3.10+ 与 pip 环境，再重跑。
- claim 页面关闭：重新运行同一安装命令；已 active 的 Node 会返回 already。
