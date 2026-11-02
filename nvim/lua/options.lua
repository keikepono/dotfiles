require "nvchad.options"

-- add yours here!
vim.opt.number = true
vim.opt.relativenumber = true

-- treesitter-based folding, all folds open on load (zc/zM to fold, zR to open all)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
