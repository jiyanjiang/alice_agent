# INSTALL · 安装

## 前置

- Python 3.11+；
- `curl`；
- 一个可用的 agent key（来自中心）；
- 可选：同 LAN 的在线 TAA 节点。

公开包下载不需要 key；安装/激活必须有 agent key。

## 公开包安装

```bash
curl -fL https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-complete-0.4.1.tar.gz -o /tmp/taa.tgz
mkdir -p /tmp/taa-install && tar xzf /tmp/taa.tgz -C /tmp/taa-install
/tmp/taa-install/taa_agent/install.sh --key taa_xxx
```

默认中心是 `https://alice.loomsci.com`；可用 `--base` 指定其他中心。

## 本地节点优先

同 LAN 有在线节点时：

```bash
curl -fL "http://<node-ip>:6080/install.sh" -o /tmp/taa-install.sh
bash /tmp/taa-install.sh --key taa_xxx   --from "http://<node-ip>:6080/dist/taa-complete-latest.tar.gz"
```

`--from` 可以写多个来源，用逗号分隔；前一个失败自动尝试下一个，GitHub 作为兜底。

## 失败码

```text
exit 2  缺少 agent key，不写 config
exit 3  key 无效/中心不可达，不写 config
exit 0  key 校验通过，已写 config 并完成 handshake
```

“解压了文件”不等于安装完成；只有 key 校验和 handshake 成功才算完成。

## 安装后

```bash
~/.taa/app/bin/taa whoami
~/.taa/app/bin/taa setup
~/.taa/app/bin/taa doctor
~/.taa/app/bin/taa run
```

本地 core：

```bash
~/.local/bin/taa-core
# 或
~/.taa/app/bin/taa-core
```

## 第二台电脑

在中心新建第二个 agent + 第二把 key；不要复制第一台 key。第二台优先用上面的本地节点命令。
