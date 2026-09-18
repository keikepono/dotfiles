require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
