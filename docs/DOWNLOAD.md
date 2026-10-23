# DOWNLOAD · 下载

## 公开包

公开仓库文件即发布；不需要 key，也不需要登录。

```text
https://github.com/jiyanjiang/team_ai_alice
```

当前包：

```text
https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-complete-0.4.1.tar.gz
```

## 本地节点包

已安装的 TAA 节点可以直接供包（不需要 key）：

```text
GET http://<node-ip>:6080/install.sh
GET http://<node-ip>:6080/dist/taa-complete-latest.tar.gz
GET http://<node-ip>:6080/dist/taa-complete-<version>.tar.gz
```

响应头包含 `X-TAA-Package-Version` 和 `X-TAA-Package-Sha256`。

第一台安装后会把干净包保存到：

```text
~/.taa/dist/taa_agent-core-<version>.tar.gz
~/.taa/dist/taa_agent-core-latest.tar.gz
```

第二台优先从这里拉，失败再回退 GitHub。

## 私有包 / 私有工具

私有下载接口保留 `--download-token`；它只解决“能不能取文件”，不改变安装时的 agent key 校验。
