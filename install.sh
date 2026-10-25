#!/usr/bin/env bash
# TAA 1.x public installer.
# No agent key is required; the Owner claim happens in the browser.
set -euo pipefail

VERSION="${TAA_VERSION:-1.0.0-beta.2}"
BASE="${TAA_BASE:-https://raw.githubusercontent.com/jiyanjiang/team_ai_alice/main}"
URL="${TAA_PACKAGE_URL:-${BASE%/}/releases/taa-${VERSION}.tar.gz}"
EXPECTED_SHA256="${TAA_PACKAGE_SHA256:-74157fd4ea492dd4583a53794fd6178d690265a135bc1ac5c97ac2bdc1c455de}"

command -v curl >/dev/null 2>&1 || { echo "x curl is required" >&2; exit 3; }
command -v tar >/dev/null 2>&1 || { echo "x tar is required" >&2; exit 3; }

for arg in "$@"; do
  case "$arg" in
    -h|--help)
      cat <<'EOF'
TAA public installer

Usage:
  ./install.sh [--home DIR] [--port N] [--no-browser] [--skip-deps]

The package installs the local runtime into TAA_HOME/app and starts Flask
on port 6080. No agent key is required; the Owner claim is in the browser.
EOF
      exit 0
      ;;
  esac
done

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "[1/3] downloading TAA ${VERSION}"
curl -fL --retry 3 --connect-timeout 10 --max-time 300 "$URL" -o "$TMP/pkg.tgz"
ACTUAL="$(shasum -a 256 "$TMP/pkg.tgz" | awk '{print $1}')"
if [ "$ACTUAL" != "$EXPECTED_SHA256" ]; then
  echo "x package SHA256 mismatch" >&2
  echo "  expected: $EXPECTED_SHA256" >&2
  echo "  actual:   $ACTUAL" >&2
  exit 4
fi

echo "[2/3] extracting"
tar xzf "$TMP/pkg.tgz" -C "$TMP"
[ -x "$TMP/taa_agent/install.sh" ] || { echo "x package layout is invalid" >&2; exit 4; }

echo "[3/3] installing runtime"
"$TMP/taa_agent/install.sh" "$@"
