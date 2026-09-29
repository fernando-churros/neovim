return {
  "nvim-lualine/lualine.nvim",

  options = {
    theme = 'gruvbox',
  },

  config = function(opts)
    require("lualine").setup(opts)
  end,
}
