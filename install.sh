#!/bin/sh
# install.sh — AllMyStuff installer for Linux and macOS.
#
#   curl -fsSL https://allmystuff.works/install.sh | sh
#   curl -fsSL https://allmystuff.works/install.sh | sh -s -- --cli-only
#
# What it does, in order:
#   1. Detects OS + CPU and picks the matching build from the latest
#      GitHub release of mrjeeves/AllMyStuff. Nothing is hosted elsewhere.
#   2. Downloads over HTTPS and verifies the SHA-256 sidecar for every
#      asset that publishes one (all portable archives do).
#   3. Linux: installs the AppImage + CLI into ~/.local/bin and writes a
#      desktop entry. macOS: unpacks AllMyStuff.app into /Applications
#      (or ~/Applications) and installs the CLI into ~/.local/bin.
#   4. Tells you if the bin directory isn't on your PATH.
#
# No root. No telemetry. No account. Uninstall = delete what it printed.
#
# Flags:            --cli-only        skip the desktop app
#                   --dir <path>      CLI/AppImage install dir (default ~/.local/bin)
# Env:              ALLMYSTUFF_INSTALL_DIR  same as --dir

set -u

REPO="mrjeeves/AllMyStuff"
BASE="https://github.com/$REPO/releases/latest/download"
BIN_DIR="${ALLMYSTUFF_INSTALL_DIR:-$HOME/.local/bin}"
CLI_ONLY=0

say()  { printf '\033[1;35m  allmystuff\033[0m %s\n' "$*"; }
fail() { printf '\033[1;31m  allmystuff\033[0m %s\n' "$*" >&2; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    --cli-only) CLI_ONLY=1 ;;
    --dir) shift; [ $# -gt 0 ] || fail "--dir needs a path"; BIN_DIR="$1" ;;
    -h|--help) sed -n '2,22p' "$0" 2>/dev/null || true; exit 0 ;;
    *) fail "unknown flag: $1 (try --cli-only, --dir <path>)" ;;
  esac
  shift
done

# ---- platform ------------------------------------------------------------
OS="$(uname -s)"
ARCH="$(uname -m)"
case "$ARCH" in
  x86_64|amd64) ARCH=x86_64 ;;
  aarch64|arm64) ARCH=aarch64 ;;
  *) fail "unsupported CPU: $ARCH (builds exist for x86_64 and aarch64)" ;;
esac
case "$OS" in
  Linux)  PLAT="linux-$ARCH" ;;
  Darwin) PLAT="macos-$ARCH" ;;
  MINGW*|MSYS*|CYGWIN*) fail "this is the Unix installer — on Windows run:  irm https://allmystuff.works/install.ps1 | iex" ;;
  *) fail "unsupported OS: $OS" ;;
esac

# ---- tools ---------------------------------------------------------------
if command -v curl >/dev/null 2>&1; then
  get() { curl -fsSL --proto '=https' --tlsv1.2 -o "$2" "$1"; }
elif command -v wget >/dev/null 2>&1; then
  get() { wget -qO "$2" "$1"; }
else
  fail "need curl or wget"
fi

sha_check() {
  # $1 = file, $2 = sidecar containing "<hash>  <name>"
  want="$(awk '{print $1}' "$2")"
  if command -v sha256sum >/dev/null 2>&1; then
    got="$(sha256sum "$1" | awk '{print $1}')"
  elif command -v shasum >/dev/null 2>&1; then
    got="$(shasum -a 256 "$1" | awk '{print $1}')"
  else
    say "warning: no sha256 tool found — skipping checksum verification"
    return 0
  fi
  [ "$want" = "$got" ] || fail "checksum mismatch for $1 — refusing to install"
  say "checksum ok · $(basename "$1")"
}

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT INT TERM

# ---- CLI (all platforms) ---------------------------------------------------
say "installing the allmystuff CLI → $BIN_DIR"
mkdir -p "$BIN_DIR"
CLI_TAR="allmystuff-$PLAT.tar.gz"
get "$BASE/$CLI_TAR"        "$TMP/$CLI_TAR"        || fail "download failed: $CLI_TAR"
get "$BASE/$CLI_TAR.sha256" "$TMP/$CLI_TAR.sha256" || fail "download failed: $CLI_TAR.sha256"
sha_check "$TMP/$CLI_TAR" "$TMP/$CLI_TAR.sha256"
tar -xzf "$TMP/$CLI_TAR" -C "$TMP"
install -m 755 "$TMP/allmystuff" "$BIN_DIR/allmystuff" 2>/dev/null \
  || { cp "$TMP/allmystuff" "$BIN_DIR/allmystuff" && chmod 755 "$BIN_DIR/allmystuff"; }
say "installed · $BIN_DIR/allmystuff"

# ---- GUI -------------------------------------------------------------------
if [ "$CLI_ONLY" -eq 0 ]; then
  if [ "$OS" = "Darwin" ]; then
    APP_TAR="AllMyStuff_$([ "$ARCH" = aarch64 ] && echo aarch64 || echo x64).app.tar.gz"
    DEST="/Applications"
    [ -w "$DEST" ] || DEST="$HOME/Applications"
    mkdir -p "$DEST"
    say "installing AllMyStuff.app → $DEST"
    get "$BASE/$APP_TAR" "$TMP/$APP_TAR" || fail "download failed: $APP_TAR"
    # (the .app archives don't publish sidecars; the CLI above is verified)
    tar -xzf "$TMP/$APP_TAR" -C "$TMP"
    rm -rf "$DEST/AllMyStuff.app"
    mv "$TMP/AllMyStuff.app" "$DEST/AllMyStuff.app"
    say "installed · $DEST/AllMyStuff.app"
    say "first launch: right-click AllMyStuff.app → Open (builds aren't notarized yet)"
  else
    # Resolve the latest tag to construct the versioned AppImage name.
    TAG="$( (curl -fsSI "https://github.com/$REPO/releases/latest" 2>/dev/null || wget -qS --max-redirect=0 -O /dev/null "https://github.com/$REPO/releases/latest" 2>&1) \
            | tr -d '\r' | sed -n 's/^[Ll]ocation:.*\/tag\///p' | tail -1)"
    [ -n "$TAG" ] || fail "couldn't resolve the latest release tag"
    VER="${TAG#v}"
    AI_ARCH="$([ "$ARCH" = x86_64 ] && echo amd64 || echo aarch64)"
    APPIMAGE="AllMyStuff_${VER}_${AI_ARCH}.AppImage"
    say "installing $APPIMAGE ($TAG) → $BIN_DIR"
    get "https://github.com/$REPO/releases/download/$TAG/$APPIMAGE" "$TMP/$APPIMAGE" || fail "download failed: $APPIMAGE"
    install -m 755 "$TMP/$APPIMAGE" "$BIN_DIR/AllMyStuff.AppImage" 2>/dev/null \
      || { cp "$TMP/$APPIMAGE" "$BIN_DIR/AllMyStuff.AppImage" && chmod 755 "$BIN_DIR/AllMyStuff.AppImage"; }
    say "installed · $BIN_DIR/AllMyStuff.AppImage"

    # Desktop entry + icon (best effort — purely cosmetic).
    ICON_DIR="$HOME/.local/share/icons"; APP_DIR="$HOME/.local/share/applications"
    mkdir -p "$ICON_DIR" "$APP_DIR" 2>/dev/null || true
    get "https://allmystuff.works/apple-touch-icon.png" "$ICON_DIR/allmystuff.png" 2>/dev/null || true
    cat > "$APP_DIR/works.allmystuff.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=AllMyStuff
Comment=Every screen, shell, and file you own — from any device
Exec=$BIN_DIR/AllMyStuff.AppImage
Icon=$ICON_DIR/allmystuff.png
Terminal=false
Categories=Network;Utility;
EOF
    say "desktop entry · $APP_DIR/works.allmystuff.desktop"
  fi
fi

# ---- PATH note -------------------------------------------------------------
case ":$PATH:" in
  *":$BIN_DIR:"*) ;;
  *) say "note: $BIN_DIR is not on your PATH — add this to your shell profile:"
     say "      export PATH=\"$BIN_DIR:\$PATH\"" ;;
esac

say "done."
if [ "$CLI_ONLY" -eq 1 ]; then
  say "try: allmystuff scan"
elif [ "$OS" = "Darwin" ]; then
  say "launch AllMyStuff from Applications · or try: allmystuff scan"
else
  say "launch AllMyStuff from your app menu · or try: allmystuff scan"
fi
