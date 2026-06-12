#!/bin/sh
# allmystuff.works/install.sh — short URL for the canonical AllMyStuff
# installer, which lives in the app repository and is maintained there:
#
#   https://github.com/mrjeeves/AllMyStuff/blob/main/scripts/install.sh
#
# This stub only fetches that script and runs it, forwarding any flags
# (--no-gui, --no-mesh, --prefix=DIR, --dry-run, --from-source), so the
# site can never drift from what the app actually ships.
#
#   curl -fsSL https://allmystuff.works/install.sh | sh
#   curl -fsSL https://allmystuff.works/install.sh | sh -s -- --no-gui

set -eu

URL="https://raw.githubusercontent.com/mrjeeves/AllMyStuff/main/scripts/install.sh"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL --proto '=https' --tlsv1.2 "$URL" | sh -s -- "$@"
elif command -v wget >/dev/null 2>&1; then
  wget -qO- "$URL" | sh -s -- "$@"
else
  echo "allmystuff: need curl or wget to install" >&2
  exit 1
fi
