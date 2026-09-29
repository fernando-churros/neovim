return {
  'nvim-mini/mini.nvim',

  version = false, 

  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()
    require("mini.starter").setup()
    require("mini.tabline").setup()
    require("mini.move").setup()
  end
}
