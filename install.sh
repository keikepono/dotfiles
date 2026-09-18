#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install it from https://brew.sh first." >&2
  exit 1
fi

echo "==> Installing packages from Brewfile"
brew bundle --file="$DOTFILES/Brewfile"

echo "==> Symlinking configs"
mkdir -p ~/.config
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/wezterm/.wezterm.lua" ~/.wezterm.lua
ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

echo "==> Bootstrapping nvim plugins"
nvim --headless "+Lazy! sync" +qa

echo "==> Installing treesitter parsers"
nvim --headless +"TSInstall! markdown markdown_inline" +"sleep 3" +qa

echo "Done. Open nvim, wezterm, or tmux to verify."
