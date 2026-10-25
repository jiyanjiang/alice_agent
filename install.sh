#!/usr/bin/env bash
# TAA Node v0.5 public installer.
# Downloads the public release archive, verifies SHA256, then runs the packaged installer.
# No agent key is required; the Owner claim happens in the browser.
set -euo pipefail

VERSION="${TAA_V05_VERSION:-0.5.0}"
CENTER="${TAA_CENTER:-https://dev.alice.loomsci.com}"
BASE="${TAA_V05_BASE:-https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main}"
URL="${TAA_V05_PACKAGE_URL:-${BASE%/}/releases/taa-node-v05-${VERSION}.tar.gz}"
EXPECTED_SHA256="${TAA_V05_SHA256:-ae4c7731690f3987889a98a3adb2e1ab7f7909a974f4ee3a3e88092f1c356d0f}"

usage() {
  cat <<'EOF'
TAA Node v0.5 public installer

Usage:
  ./install.sh [options]

Options:
  --center URL     center base URL (default: $TAA_CENTER or https://dev.alice.loomsci.com)
  --home DIR       local identity directory (default: $HOME/.taa-v05)
  --init-only      install/init only; do not claim
  --no-browser     print CLAIM_URL instead of opening a browser
  -h, --help       show this help

Environment:
  TAA_CENTER             center base URL
  TAA_V05_VERSION        release version (default: 0.5.0)
  TAA_V05_PACKAGE_URL    override package download URL
  TAA_V05_SHA256         override expected package SHA256
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

echo "[2/3] extracting"
tar xzf "$TMP/pkg.tgz" -C "$TMP"
PKG="$TMP/taa-node-v05"
[[ -x "$PKG/install.sh" ]] || { echo "x package layout is invalid" >&2; exit 4; }

# Inject the public beta center unless the caller supplied one.
HAS_CENTER=0
for arg in "$@"; do
  [[ "$arg" == "--center" ]] && HAS_CENTER=1
done
if [[ "$HAS_CENTER" == "0" ]]; then
  set -- "$@" --center "$CENTER"
fi

echo "[3/3] running packaged installer"
"$PKG/install.sh" "$@"
