-------------------------------------------------------------------------------
-- Import Lua modules
-------------------------------------------------------------------------------
require('core.settings')
require('core.keymaps')
require('core.auto_commands')

-- Package manager
-- require('plugins.packer-nvim')
require('plugins.lazy-nvim')

-- Funnctional user interface
-- require('plugins.onedarkpro-nvim')
require('plugins.catppuccin')
require('plugins.bufferline')
require('plugins.lualine')
require('plugins.noice-nvim')
require('plugins.nvim-notify')

-- LSP and coding
require('plugins.nvim-treesitter')
require('plugins.nvim-lspconfig')
require('plugins.mason')
require('plugins.null-ls')
require('plugins.nvim-cmp')
require('plugins.nvim-dap')
require('plugins.nvim-navic')
require('plugins.comment-nvim')

-- Utilities
require('plugins.telescope')
require('plugins.nvim-tree')
require('plugins.symbols-outline-nvim')
require('plugins.vim-illuminate')
require('plugins.todo-comments-nvim')
require('plugins.which-key')
require('plugins.zen-mode')
require('plugins.colorful-winsep')
require('plugins.indent-blankline')
require('plugins.gitsigns')
require('plugins.alpha-nvim')
require('plugins.neovim-session-manager')
require('plugins.toggleterm-nvim')
require('plugins.neogen')
