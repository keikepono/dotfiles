require "nvchad.autocmds"

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if vim.bo.modified then
      vim.cmd "silent write"
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "DiffviewDiffBufRead",
  callback = function()
    vim.opt_local.scrollbind = true
    vim.opt_local.cursorbind = true
  end,
})
