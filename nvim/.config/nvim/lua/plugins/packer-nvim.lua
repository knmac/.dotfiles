-------------------------------------------------------------------------------
-- Plugin manager
-- wbthomason/packer.nvim
-------------------------------------------------------------------------------
local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require('packer')

-- Add packages
return packer.startup(function()
    use 'wbthomason/packer.nvim'                -- packer can manage itself

    -- LSP and coding
    use {
        'neovim/nvim-lspconfig',                -- language server protocol
        requires = {
            'williamboman/nvim-lsp-installer' , -- lsp installer helper
        },
    }
    use 'nvim-lua/plenary.nvim'                 -- ultilities used by many other plugins
    use 'nvim-treesitter/nvim-treesitter'       -- code parser generator for syntax highlighting
    use 'mfussenegger/nvim-lint'                -- code linter for style checking
    use {
        'hrsh7th/nvim-cmp',                     -- code completion
        requires = {
            'hrsh7th/cmp-nvim-lsp',             -- dependency of nvim-cmp
            'hrsh7th/cmp-buffer',               -- dependency of nvim-cmp
            'hrsh7th/cmp-path',                 -- dependency of nvim-cmp
            'onsails/lspkind-nvim'              -- pictogram for LSP
         },
    }
    use 'ray-x/lsp_signature.nvim'              -- show code signature in completion
    use 'numToStr/Comment.nvim'                 -- code commenter

    -- Functional user interface
    -- use 'joshdick/onedark.vim'                  -- colorscheme
    use 'olimorris/onedarkpro.nvim'             -- colorscheme
    use 'ryanoasis/vim-devicons'                -- extra icons without colors
    use 'kyazdani42/nvim-web-devicons'          -- extra icons with colors
    use 'akinsho/bufferline.nvim'               -- buffer line (top)
    use 'nvim-lualine/lualine.nvim'             -- status line (bottom)

    -- Utilities
    use 'kyazdani42/nvim-tree.lua'              -- file explorer
    use 'liuchengxu/vista.vim'                  -- view and search for LSP symbols
    use 'nvim-telescope/telescope.nvim'         -- fuzzy finder for multiple things
    use 'andymass/vim-matchup'                  -- highlight and navigate sets of matching text
    use 'RRethy/vim-illuminate'                 -- highlight related text under cursor
    use 'folke/todo-comments.nvim'              -- highlight and search TODO tags
    use 'lukas-reineke/indent-blankline.nvim'   -- show indent line
    use 'lewis6991/gitsigns.nvim'               -- git diff sign
    use 'norcalli/nvim-colorizer.lua'           -- colorize color code
    use 'p00f/nvim-ts-rainbow'                  -- colorize parentheses
    use 'goolord/alpha-nvim'                    -- start page greeter
    use 'Shatur/neovim-session-manager'         -- session manager
    use 'akinsho/toggleterm.nvim'               -- toggle terminal

    -- Extra nvim plugins
    use {
        'plasticboy/vim-markdown',              -- markdown helper
        'godlygeek/tabular'                     -- format table in markdown
    }
end)
