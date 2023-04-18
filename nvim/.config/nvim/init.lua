-------------------------------------------------------------------------------
-- Import Lua modules
-------------------------------------------------------------------------------
require('core.settings')
require('core.keymaps')
require('core.auto_commands')

-- Package manager
require('plugins.lazy-nvim')

-- Funnctional user interface
require('plugins.ui.catppuccin')
require('plugins.ui.barbar-nvim')
require('plugins.ui.lualine')
require('plugins.ui.noice-nvim')
require('plugins.ui.nvim-notify')

-- LSP and coding
require('plugins.coding.nvim-treesitter')
require('plugins.coding.nvim-lspconfig')
require('plugins.coding.mason')
require('plugins.coding.null-ls')
require('plugins.coding.nvim-cmp')
require('plugins.coding.nvim-dap')
require('plugins.coding.nvim-navic')
require('plugins.coding.comment-nvim')
require('plugins.coding.neogen')

-- Utilities
require('plugins.utils.telescope')
require('plugins.utils.neo-tree-nvim')
require('plugins.utils.symbols-outline-nvim')
require('plugins.utils.vim-illuminate')
require('plugins.utils.todo-comments-nvim')
require('plugins.utils.which-key')
require('plugins.utils.zen-mode')
require('plugins.utils.colorful-winsep')
require('plugins.utils.indent-blankline')
require('plugins.utils.gitsigns')
require('plugins.utils.alpha-nvim')
require('plugins.utils.neovim-session-manager')
require('plugins.utils.toggleterm-nvim')
