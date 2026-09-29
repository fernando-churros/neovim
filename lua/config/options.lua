local opt = vim.opt
local neo = vim.g

--Basic Usage
opt.number = true               -- print the line number in front of each line
opt.relativenumber = true       -- show relative line number in front of each line
opt.mouse = "a"                 -- Enables mouse support.
opt.colorcolumn = "100"         -- columns to highlight
opt.linespace = 2               -- number of pixel lines to use between charactersprint the line number in front of each line
opt.scrolloff = 4               -- minimum nr. of lines above and below cursor
opt.cursorline = true           -- highlight the screen line of the cursor
opt.cmdwinheight = 1            -- number of lines to use for the command-line
opt.confirm = true              -- ask what to do about unsaved/read-only files
opt.clipboard = "unnamedplus"   --  use the clipboard as the unnamed register
opt.mousefocus = true

--Wrap
opt.linebreak = true  -- wrap long lines at a blank
opt.breakindent = false  -- wrapped line repeats indentuse the clipboard as the unnamed register
opt.wrap = true

--Tabs/indent
opt.autoindent = true           -- take indent for new line from previous line
opt.smartindent = false         -- smart autoindenting for C programs
opt.expandtab = true            -- use spaces when <Tab> is inserted
opt.smarttab = true             -- <Tab> in leading whitespace indents by 'shiftwidth'
opt.tabstop = 2                 -- number of columns between two tab stops
opt.softtabstop = 2             -- number of columns between two soft tab stops
opt.shiftwidth = 2              -- number of spaces to use for (auto)indent step

-- Search
opt.hlsearch = true             -- highlight matches with last search pattern
opt.ignorecase = true           -- ignore case in search patterns
opt.incsearch = true            -- highlight match while typing search pattern
opt.smartcase = true            -- no ignore case when pattern has uppercase

opt.autoread = true             -- autom. read file when changed outside of Vim
opt.showmatch = true            -- briefly jump to matching bracket if insert one
opt.backup = false              -- keep backup file after overwriting a file
opt.splitbelow = true           -- new window from split is below the current one
opt.splitright = true           -- new window is put right of the current one
opt.swapfile = false            -- whether to use a swapfile for a buffer


-- Neovide Sets
if vim.g.neovide then
  opt.guifont = "JetBrainsMono Nerd Font:h11"
  opt.colorcolumn = "140"         -- columns to highlight
  neo.neovide_scale_factor = 0.81		-- Control scale for neovide
  neo.neovide_padding_top = 8			-- Controls the space beteween window border 
  neo.neovide_padding_bottom = 0		-- Controls the space beteween window border 
  neo.neovide_padding_right = 8			-- Controls the space beteween window border 
  neo.neovide_padding_left = 8			-- Controls the space beteween window border 
  neo.neovide_scroll_animation_length = 0.3	-- Sets how long the scroll animation takes to complete
  neo.neovide_hide_mouse_when_typing = true	-- The mouse will be hidden as soon as you start typing
  neo.neovide_cursor_animate_in_insert_mode = true
  neo.neovide_cursor_animate_command_line = true 
end
