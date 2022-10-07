------------------------------------------------------------------------------
-- Import Lua modules
-------------------------------------------------------------------------------
require('settings')
require('keymaps')
require('auto_commands')
require('plugins/packer-nvim')

-- LSP and coding
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/null-ls')
require('plugins/nvim-cmp')
require('plugins/comment-nvim')
require('plugins/nvim-navic')

-- User interface
-- require('plugins/onedarkpro-nvim')
require('plugins/catppuccin')
require('plugins/bufferline')
require('plugins/lualine')
require('plugins/symbols-outline-nvim')

-- Utilities
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/vim-illuminate')
require('plugins/todo-comments-nvim')
require('plugins/indent-blankline')
require('plugins/gitsigns')
require('plugins/alpha-nvim')
require('plugins/neovim-session-manager')
require('plugins/toggleterm-nvim')

-- Extra vimscript-based config
require('plugins/vim-doge')
