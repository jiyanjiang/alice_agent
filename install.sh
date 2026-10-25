#!/usr/bin/env bash
# TAA Node v0.5 public installer.
# Downloads the public release archive, verifies SHA256, then runs the packaged installer.
# No agent key is required; the Owner claim happens in the browser.
set -euo pipefail

VERSION="${TAA_V05_VERSION:-0.5.1}"
CENTER="${TAA_CENTER:-https://alice.loomsci.com}"
BASE="${TAA_V05_BASE:-https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main}"
URL="${TAA_V05_PACKAGE_URL:-${BASE%/}/releases/taa-node-v05-${VERSION}.tar.gz}"
EXPECTED_SHA256="${TAA_V05_SHA256:-9ea83e754e5b835678e4e35535624ffc0792f0dddb19c2f10bc427c126a2ffe2}"
APP="${TAA_V05_APP:-$HOME/.taa-v05/app}"
TAA_HOME="${TAA_V05_HOME:-$HOME/.taa-v05}"
_prev=""
for _arg in "$@"; do
  [[ "$_prev" == "--home" ]] && TAA_HOME="$_arg"
  _prev="$_arg"
done

usage() {
  cat <<'EOF'
TAA Node v0.5 public installer

Usage:
  ./install.sh [options]

Options:
  --center URL     center base URL (default: $TAA_CENTER or https://alice.loomsci.com)
  --home DIR       local identity directory (default: $HOME/.taa-v05)
  --init-only      install/init only; do not claim
  --no-browser     print CLAIM_URL instead of opening a browser
  -h, --help       show this help

Environment:
  TAA_CENTER             center base URL
  TAA_V05_VERSION        release version (default: 0.5.1)
  TAA_V05_PACKAGE_URL    override package download URL
  TAA_V05_SHA256         override expected package SHA256
  TAA_V05_APP            runtime install directory (default: $HOME/.taa-v05/app)
EOF
}

command -v curl >/dev/null 2>&1 || { echo "x curl is required" >&2; exit 3; }
command -v tar >/dev/null 2>&1 || { echo "x tar is required" >&2; exit 3; }

for arg in "$@"; do
  case "$arg" in
    -h|--help) usage; exit 0 ;;
  esac
done

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "[1/3] downloading TAA Node v${VERSION}"
curl -fL --retry 3 --connect-timeout 10 --max-time 300 "$URL" -o "$TMP/pkg.tgz"

ACTUAL_SHA256="$(shasum -a 256 "$TMP/pkg.tgz" | awk '{print $1}')"
if [[ "$ACTUAL_SHA256" != "$EXPECTED_SHA256" ]]; then
  echo "x package SHA256 mismatch" >&2
  echo "  expected: $EXPECTED_SHA256" >&2
  echo "  actual:   $ACTUAL_SHA256" >&2
  exit 4
fi

echo "[2/3] installing runtime to $APP"
tar xzf "$TMP/pkg.tgz" -C "$TMP"
SRC_PKG="$TMP/taa-node-v05"
[[ -x "$SRC_PKG/install.sh" ]] || { echo "x package layout is invalid" >&2; exit 4; }

# Keep the runtime after this script exits. Identity lives outside the app dir.
mkdir -p "$(dirname "$APP")"
rm -rf "$APP"
cp -R "$SRC_PKG" "$APP"

# Inject the public beta center unless the caller supplied one.
HAS_CENTER=0
for arg in "$@"; do
  [[ "$arg" == "--center" ]] && HAS_CENTER=1
done
if [[ "$HAS_CENTER" == "0" ]]; then
  set -- "$@" --center "$CENTER"
fi

echo "[3/3] running packaged installer"
"$APP/install.sh" "$@"

echo "TAA_APP=$APP"
echo "TAA_UI=TAA_V05_HOME=\"$TAA_HOME\" \"$APP/taa\" open"
