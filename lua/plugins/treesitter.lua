return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  event = {"BufReadPost", "BufNewFile"},

  config = function()
    require("nvim-treesitter").setup({
      ensure_instaled = {
        "python",
        "html",
        "css",
        "lua",
        "java",
        "bash",
        "regex",
        "json",
      },
      auto_install = true,
    })
  end
}

