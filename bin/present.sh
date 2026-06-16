#!/usr/bin/env bash
set -euo pipefail

# Launch Slidev in remote mode and print the URLs (+ QR) for phone control.
# Usage: ./bin/present.sh [password] [port]

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PASSWORD="${1:-}"
PORT="${2:-3030}"

# Best-effort LAN IP detection (macOS Wi-Fi first, then any active interface).
IP="$(ipconfig getifaddr en0 2>/dev/null || true)"
[ -z "$IP" ] && IP="$(ipconfig getifaddr en1 2>/dev/null || true)"
[ -z "$IP" ] && IP="$(ifconfig 2>/dev/null | awk '/inet / && $2 != "127.0.0.1" {print $2; exit}')"
[ -z "$IP" ] && IP="localhost"

PRESENTER_URL="http://${IP}:${PORT}/presenter"
SLIDES_URL="http://${IP}:${PORT}/"

echo "Slides:    $SLIDES_URL"
echo "Presenter: $PRESENTER_URL  (control the deck from your phone)"
echo

if command -v qrencode >/dev/null 2>&1; then
  echo "Scan to open the presenter view:"
  qrencode -t ANSIUTF8 "$PRESENTER_URL"
  echo
else
  echo "(install 'qrencode' for a scannable QR code — e.g. 'brew install qrencode')"
  echo
fi

cd "$ROOT/slides"
if [ -n "$PASSWORD" ]; then
  exec npx slidev --remote "$PASSWORD" --port "$PORT"
else
  echo "Tip: pass a password to gate remote access — ./bin/present.sh <password>"
  exec npx slidev --remote --port "$PORT"
fi
