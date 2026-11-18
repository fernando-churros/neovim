require("config.lazy")

vim.o.background = "dark"
vim.cmd.colorscheme("monokai-pro")
-- use Neovim nightly branch
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'

-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
