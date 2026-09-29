vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "<leader>h", "<cmd>NvimTreeToggle<CR>", { desc = "Abre e fecha o nvim tree"})
map("n", "<leader>f", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

-- Buffer Navigation
map("n", "<leader>b", "<cmd>bn<CR>", { desc = "Next buffer" })
map("n", "<leader>p", "<cmd>bp<CR>", { desc = "Previuos buffer" })

-- Tab
map("n", "<Tab>", "V>", {desc = "Insert tab in line"})
map("v", "<Tab>", ">")

