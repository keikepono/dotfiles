# dotfiles

Personal config for nvim (NvChad), WezTerm, and tmux.

## Setup on a new machine

Requires [Homebrew](https://brew.sh).

```bash
git clone https://github.com/keikepono/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This installs neovim, ripgrep, node, tmux, wezterm, and tree-sitter-cli via the `Brewfile`,
symlinks the configs into place, and bootstraps nvim plugins + treesitter parsers.

## Manual setup

If you'd rather not run the script:

```bash
brew bundle --file=Brewfile

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

Then open nvim and let Lazy sync plugins from `lazy-lock.json`.

## Notes

- `nvim/` is based on [NvChad/starter](https://github.com/NvChad/starter).
- `tree-sitter-cli` is required for treesitter parsers (e.g. markdown, used by render-markdown.nvim) to compile.
