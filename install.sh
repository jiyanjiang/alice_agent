#!/usr/bin/env bash
# TAA Complete installer (v2.1)
# - 公开包/本地包：下载不需要 token
# - 安装/激活：必须 agent key
# - 私有包/私有镜像：可选 --download-token
# - 包来源：--from 可逗号分隔；按顺序尝试，GitHub 作为兜底
# - 成功安装后把包存到 $TAA_HOME/dist，供同 Team 节点二次分发
set -euo pipefail

BASE="${TAA_BASE:-https://alice.loomsci.com}"
TAA_HOME="${TAA_HOME:-$HOME/.taa}"
DEST="${TAA_HOME}/app"
KEY="${TAA_AGENT_KEY:-}"
FROM="${TAA_FROM:-}"
DL_TOKEN=""
DEFAULT_FALLBACK="${TAA_FALLBACK_URL:-https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main/releases/taa-complete-0.4.1.tar.gz}"
ARG_KEY=""
ARG_FROM=""
ARG_TOKEN=""
ARG_BASE=""
PACKAGE_TARBALL=""

usage() {
  cat <<'USAGE'
TAA Complete installer

用法：
  ./install.sh --key taa_xxx [--from <tar.gz|目录>[,<tar.gz|目录>...]] [--download-token <token>]

说明：
  --key             必填；agent key，用于安装/激活
  --from            可选；包来源，按顺序尝试；本地节点优先，GitHub 兜底
                    例：--from http://192.168.1.20:6080/dist/taa-complete-latest.tar.gz
  --download-token  可选；仅私有包/私有镜像需要；值可以是 agent key
  --base            可选；中心地址，默认 https://alice.loomsci.com

没有 agent key 时不会安装，也不会写配置。
申请内测：info@loomsci.com
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --key) KEY="${2:-}"; shift 2 ;;
    --from) ARG_FROM="${2:-}"; shift 2 ;;
    --download-token) ARG_TOKEN="${2:-}"; shift 2 ;;
    --base) ARG_BASE="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "x 未知参数：$1" >&2; usage >&2; exit 64 ;;
  esac
done
[[ -n "$ARG_FROM" ]] && FROM="$ARG_FROM"
[[ -n "$ARG_TOKEN" ]] && DL_TOKEN="$ARG_TOKEN"
[[ -n "$ARG_BASE" ]] && BASE="$ARG_BASE"

fail_key() {
  local code="$1" msg="$2"
  cat >&2 <<EOF
x $msg

TAA 当前为内测，安装/激活必须有 agent key。

1) 发邮件到 info@loomsci.com 申请测试资格
2) 登录 ${BASE}
3) 创建 Agent，复制 agent key
4) 运行安装命令：./install.sh --key taa_xxx

没有 key 不会安装，也不会写配置。
EOF
  exit "$code"
}

# ---------- 1) key 门禁：先校验，后写盘 ----------
if [[ -z "$KEY" ]]; then
  fail_key 2 "缺少 agent key"
fi
if [[ "$KEY" != taa_* ]]; then
  fail_key 3 "agent key 格式不正确"
fi
command -v curl >/dev/null 2>&1 || { echo "x 需要 curl" >&2; exit 3; }
ME_TMP="$(mktemp)"
TMP=""
trap 'rm -f "$ME_TMP"; rm -rf "${TMP:-}"' EXIT
HTTP_CODE="$(curl -sS -o "$ME_TMP" -w '%{http_code}' \
  -H "Authorization: Bearer ${KEY}" \
  "${BASE%/}/agent/me" || true)"
if [[ "$HTTP_CODE" != "200" ]]; then
  if [[ "$HTTP_CODE" == "401" || "$HTTP_CODE" == "403" ]]; then
    fail_key 3 "agent key 无效或已被撤销"
  fi
  echo "x 无法校验 agent key：HTTP ${HTTP_CODE:-network-error}" >&2
  echo "  请检查网络/中心地址：${BASE}" >&2
  exit 3
fi

# ---------- 2) Python ----------
PY="${TAA_PYTHON:-}"
if [[ -z "$PY" ]]; then
  PY="$(command -v python3.12 || command -v python3 || true)"
fi
if [[ -z "$PY" ]] || ! "$PY" -c 'import sys; raise SystemExit(0 if sys.version_info >= (3, 11) else 1)'; then
  echo "x 需要 Python 3.11+；可用 TAA_PYTHON=/path/to/python3.12 指定" >&2
  exit 3
fi

# ---------- 3) 包来源：本地包 > --from 顺序 > GitHub 兜底 ----------
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
if [[ -x "${SRC_DIR}/bin/taa" && -d "${SRC_DIR}/core" ]]; then
  PACKAGE_DIR="$SRC_DIR"
  echo "[1/5] 使用本地包：$PACKAGE_DIR"
else
  TMP="$(mktemp -d)"
  SOURCES=()
  if [[ -n "$FROM" ]]; then
    IFS=',' read -r -a SOURCES <<< "$FROM"
  fi
  # 显式来源失败后仍回退 GitHub；已列出的不重复追加。
  case " ${SOURCES[*]-} " in
    *" $DEFAULT_FALLBACK "*) ;;
    *) SOURCES+=("$DEFAULT_FALLBACK") ;;
  esac

  find_pkg() {
    find "$1" -maxdepth 1 -type d \( -name 'taa_agent' -o -name 'taa-complete' \) | head -1
  }

  fetch_url() {
    local url="$1" out="$2" tb
    mkdir -p "$out/extract"
    tb="$out/taa.tgz"
    if [[ -n "$DL_TOKEN" ]]; then
      curl -fsSL --connect-timeout 5 --max-time 180 \
        -H "Authorization: Bearer ${DL_TOKEN}" "$url" -o "$tb" || return 1
    else
      curl -fsSL --connect-timeout 5 --max-time 180 "$url" -o "$tb" || return 1
    fi
    tar xzf "$tb" -C "$out/extract" || return 1
    PACKAGE_DIR="$(find_pkg "$out/extract")"
    PACKAGE_TARBALL="$tb"
    [[ -n "$PACKAGE_DIR" && -x "${PACKAGE_DIR}/bin/taa" ]]
  }

  PACKAGE_DIR=""
  idx=0
  for src in "${SOURCES[@]}"; do
    idx=$((idx + 1))
    if [[ -d "$src" ]]; then
      if [[ -x "${src}/bin/taa" ]]; then
        echo "[1/5] 使用本地目录：$src"
        PACKAGE_DIR="$src"
        PACKAGE_TARBALL=""
        break
      fi
      echo "[1/5] 跳过无效目录：$src"
      continue
    fi
    echo "[1/5] 尝试来源 ${idx}/${#SOURCES[@]}：$src"
    if fetch_url "$src" "${TMP}/src-${idx}"; then
      break
    fi
    echo "  ! 来源不可用，尝试下一个"
    PACKAGE_DIR=""
    PACKAGE_TARBALL=""
  done

  if [[ -z "$PACKAGE_DIR" ]]; then
    echo "x 没有可用的包来源；请检查本地节点或网络" >&2
    echo "  已尝试：${SOURCES[*]-}" >&2
    exit 3
  fi
fi

# ---------- 4) 安装代码 ----------
echo "[2/5] 安装到 ${DEST}"
mkdir -p "$TAA_HOME"
if [[ "$(cd "$PACKAGE_DIR" && pwd)" == "$(cd "$DEST" 2>/dev/null && pwd || true)" ]]; then
  echo "  当前目录就是安装目录，跳过复制"
else
  rm -rf "$DEST"
  mkdir -p "$DEST"
  cp -R "${PACKAGE_DIR}/." "$DEST/"
fi

# ---------- 4.5) 保存一份干净包，供本地节点 / 第二台电脑拉取 ----------
PKG_VER="$(head -1 "${PACKAGE_DIR}/VERSION" 2>/dev/null | tr -d '[:space:]' || true)"
[[ -n "$PKG_VER" ]] || PKG_VER="unknown"
mkdir -p "${TAA_HOME}/dist"
PKG_OUT="${TAA_HOME}/dist/taa_agent-core-${PKG_VER}.tar.gz"
if [[ -n "${PACKAGE_TARBALL}" && -f "${PACKAGE_TARBALL}" ]]; then
  cp "${PACKAGE_TARBALL}" "$PKG_OUT"
else
  if tar czf "$PKG_OUT" \
      --exclude='data.db*' --exclude='*/data.db*' \
      --exclude='memory.db*' --exclude='*/memory.db*' \
      --exclude='*.key' --exclude='*/static/uploads/*' \
      --exclude='*/bootstrap/*' --exclude='*/rooms/*' --exclude='*/certs/*' \
      --exclude='*/__pycache__/*' --exclude='*.pyc' \
      --exclude='*/dist/taa_agent-core-*.tar.gz' \
      -C "$(dirname "$PACKAGE_DIR")" "$(basename "$PACKAGE_DIR")"; then
    echo "  本地共享包：$PKG_OUT"
  else
    echo "  ! 无法生成本地共享包；不影响当前安装" >&2
  fi
fi
if [[ -f "$PKG_OUT" ]]; then
  cp "$PKG_OUT" "${TAA_HOME}/dist/taa_agent-core-latest.tar.gz"
  echo "  本地节点包源：${TAA_HOME}/dist/taa_agent-core-latest.tar.gz"
fi

# ---------- 5) 依赖 ----------
if [[ "${TAA_SKIP_DEPS:-0}" == "1" ]]; then
  echo "[3/5] 跳过依赖安装 (TAA_SKIP_DEPS=1)"
else
  VENV="${TAA_HOME}/venv"
  if [[ ! -x "${VENV}/bin/python" ]]; then
    "${PY}" -m venv "$VENV"
  fi
  "${VENV}/bin/python" -m pip install --disable-pip-version-check -r "${DEST}/requirements-core.txt"
  PY="${VENV}/bin/python"
  echo "  python: ${PY}"
fi

# ---------- 6) 写配置/入口 ----------
echo "[4/5] 写入身份与命令入口"
export TAA_HOME
export TAA_PYTHON="$PY"
"${PY}" "${DEST}/bin/taa" --base "$BASE" --key "$KEY"
mkdir -p "${HOME}/.local/bin"
cat > "${HOME}/.local/bin/taa" <<WRAP
#!/usr/bin/env bash
exec "${PY}" "${DEST}/bin/taa" "\$@"
WRAP
chmod +x "${HOME}/.local/bin/taa"
cat > "${HOME}/.local/bin/taa-core" <<WRAP
#!/usr/bin/env bash
TAA_PYTHON="${PY}" exec "${DEST}/bin/taa-core" "\$@"
WRAP
chmod +x "${HOME}/.local/bin/taa-core"

echo "[5/5] 完成"
echo "  code:    ${DEST}"
echo "  config:  ${TAA_HOME}/config.toml"
echo "  command: ${HOME}/.local/bin/taa"
echo "  local:   ${HOME}/.local/bin/taa-core"
echo "  package: ${TAA_HOME}/dist/taa_agent-core-latest.tar.gz"
