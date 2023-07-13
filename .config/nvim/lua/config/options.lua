-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.exrc = true

-- tests
vim.g["test#strategy"] = "dispatch"

-- ensure signcolumn is always enabled
require("lazyvim.util").on_attach(function()
  vim.opt.signcolumn = "yes"
end)
