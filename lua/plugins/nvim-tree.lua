return {
	'nvim-tree/nvim-tree.lua',

  config = function()
    require("nvim-tree").setup({
      view = { width = 32, side = "right", },
      renderer = { group_empty = true },
      filters = { dotfiles = true },
    })
  end
}
