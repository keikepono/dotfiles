# dotfiles

Personal config for nvim (NvChad), WezTerm, and tmux.

## Setup on a new machine

```bash
git clone git@github.com:keikepono/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

Then open nvim and let Lazy sync plugins from `lazy-lock.json`.

## Notes

- `nvim/` is based on [NvChad/starter](https://github.com/NvChad/starter).
