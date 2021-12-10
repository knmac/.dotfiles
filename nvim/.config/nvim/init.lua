-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')
require('keymaps')
require('plugins/packer-nvim')

-- LSP and coding
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/nvim-lint')
require('plugins/nvim-cmp')
require('plugins/lsp-signature-nvim')
require('plugins/comment-nvim')

-- User interface
require('plugins/bufferline')
require('plugins/lualine')

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

-- Extra
require('plugins/markdown')
