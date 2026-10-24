#!/usr/bin/env bash
# Set up algo on this machine. Safe to re-run.
#
#   _tools/algo/install.sh                 install; keep existing, different Zed files
#   _tools/algo/install.sh --replace-zed   back up differing Zed files (*.bak) and replace them

set -euo pipefail

readonly TOOL_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
readonly BIN_DIR="$HOME/.local/bin"
readonly ZED_DIR="$HOME/.config/zed"

replace_zed=0
case "${1:-}" in
  "") ;;
  --replace-zed) replace_zed=1 ;;
  *) printf 'usage: %s [--replace-zed]\n' "$0" >&2; exit 2 ;;
esac

ok()   { printf '  ✓ %s\n' "$*"; }
todo() { printf '  ! %s\n' "$*"; }
die()  { printf '  ✗ %s\n' "$*" >&2; exit 1; }

echo "Toolchains"
command -v clang++ > /dev/null || die "clang++ missing — run: xcode-select --install"
ok "clang++ $(clang++ --version | head -1 | sed 's/.*version \([^ ]*\).*/\1/')"
command -v rustc > /dev/null || die "rustc missing — run: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
ok "rustc $(rustc --version | cut -d' ' -f2)"
if [[ -d "$(rustc --print sysroot)/lib/rustlib/src/rust/library" ]]; then
  ok "rust-src"
else
  rustup component add rust-src
  ok "rust-src installed"
fi

echo "Command"
mkdir -p "$BIN_DIR"
ln -sf "$TOOL_DIR/algo" "$BIN_DIR/algo"
ok "$BIN_DIR/algo → $TOOL_DIR/algo"
case ":$PATH:" in
  *":$BIN_DIR:"*) ok "$BIN_DIR is on PATH" ;;
  *) todo "add to ~/.zshrc, then restart the terminal and Zed:  export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac

echo "Zed (~/.config/zed)"
mkdir -p "$ZED_DIR"
for src in "$TOOL_DIR"/zed/*.json; do
  name="$(basename "$src")"
  dest="$ZED_DIR/$name"
  if [[ ! -e "$dest" ]]; then
    cp "$src" "$dest"
    ok "$name installed"
  elif cmp -s "$src" "$dest"; then
    ok "$name up to date"
  elif [[ $replace_zed -eq 1 ]]; then
    cp "$dest" "$dest.bak"
    cp "$src" "$dest"
    ok "$name replaced (old copy: $name.bak)"
  else
    todo "$name differs — merge by hand from $src, or re-run with --replace-zed"
  fi
done

"$TOOL_DIR/algo" sync

echo "Done. Try: cd content/algorithms/problem-solving/examples/bubble-sort && algo test bubble-sort.cpp"
