return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup({

      options = {
        theme = "onedark",
        globalstatus = false,
      },

      sections = {
        lualine_z = {
          {
            function()
              return "Explorer"
            end,

            on_click = function()
              vim.cmd("Neotree right toggle")
            end,
          },
        },
      },

    })
  end,
}
