return {
    "nvim-tree/nvim-tree.lua",

    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = true, -- Show hidden files (dotfiles)
        },
        view = {
          side = "right",
          width = 30,
        },
      })
    end,
  }
