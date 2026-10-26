# TAA 1.0.0-beta.7 · 公测

- 产品版本：`1.0.0-beta.7`
- runtime：`2.2.47`
- 更新指针：`releases/latest.json`
- 包：`releases/taa-1.0.0-beta.7.tar.gz`
- 大小：3,227,489 bytes
- SHA256：`a623cc078154e236fe1e917aaed920e9c2a3fb4e06a8692cb1ee1486cc873f65`

## 本版重点：自动检查更新

三档模式：

```text
notify   只提示
download 自动下载 + 提示（默认）
auto     自动下载 + 空闲时自动安装 + 失败回滚
```

默认：

```text
检查：10:07 / 20:07
模式：download
自动安装：关闭
```

每天最多检查两次、自动安装一次；失败后 6 小时不重试。

### 更新入口

```text
/app/version  更新卡片：检查 / 下载 / 安装并重启
/app/inbox    系统通知
/app/settings 更新模式
```

### 更新源

```text
https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/latest.json
```

必须：

```text
HTTPS
固定仓库
SHA256 校验
只升不降
min_upgrade_from 检查
```

### 自动安装保护

`auto` 只在：

```text
无运行中任务
无运行中房间
agent 空闲
当天未自动安装
```

否则只下载，不重启。

## 保留 beta.6 能力

- 数据保护清单
- 原子升级
- 自动回滚
- `events.db` 迁移
- 公开主页 / 好友 / 2+2 工作组
- 中心中继工作组消息

## 已知限制

```text
更新器 macOS 实测；Windows 原生未验证
自动安装尚未在两台真实物理机 2+2 工作组中验证
工作组消息仍是中心中继 + 页面刷新
```

## 回滚

```text
taa-1.0.0-beta.6.tar.gz
taa-1.0.0-beta.5.tar.gz
taa-1.0.0-beta.4.tar.gz
```

## 校验

```bash
shasum -a 256 -c SHA256SUMS
```
