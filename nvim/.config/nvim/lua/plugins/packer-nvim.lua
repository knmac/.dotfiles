-------------------------------------------------------------------------------
-- Plugin manager
-- wbthomason/packer.nvim
-------------------------------------------------------------------------------
-- local packer = require('packer')
-- vim.cmd [[ packadd packer.nvim ]]

-- ============================================================================
-- Auto install packer
-- ============================================================================
local packer_url = 'https://github.com/wbthomason/packer.nvim'
local install_pth = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local first_run = false

if vim.fn.empty(vim.fn.glob(install_pth)) > 0 then
    print('Installing package manager "packer"...')
    vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_pth})
    print('Done')

    vim.cmd('packadd packer.nvim')
    first_run = true
end

-- ============================================================================
-- Add packages
-- ============================================================================
local packer = require('packer')
packer.startup(function(use)
    use 'wbthomason/packer.nvim'                -- packer can manage itself
    use 'nvim-lua/plenary.nvim'                 -- ultilities used by many other plugins

    -- LSP and coding
    use 'nvim-treesitter/nvim-treesitter'       -- code parser generator for syntax highlighting
    use {
        'williamboman/mason.nvim',              -- portable package manager for LSP servers, DAP servers, linters, and formatter
        'neovim/nvim-lspconfig',                -- language server protocol, must be placed after mason
        'williamboman/mason-lspconfig.nvim',    -- bridges mason.nvim and nvim-lspconfig
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',      -- linter and formatter
        'jayp0521/mason-null-ls.nvim',          -- bridges mason.nvim and null-ls
    }
    use {
        'mfussenegger/nvim-dap',                -- debug adapter protocol
        'rcarriga/nvim-dap-ui',                 -- UI for nvim-dap
    }
    use {
        'hrsh7th/nvim-cmp',                     -- code completion
        'hrsh7th/cmp-nvim-lsp',                 -- source for neovim's built-in language server client
        'hrsh7th/cmp-buffer',                   -- source for buffer words
        'hrsh7th/cmp-path',                     -- source for filesystem paths
        'hrsh7th/cmp-cmdline',                  -- source for vim's cmdline
        'hrsh7th/cmp-nvim-lsp-signature-help',  -- source for displaying function signatures with the current parameter emphasized
        'hrsh7th/cmp-calc',                     -- source for math calculation
        'onsails/lspkind-nvim',                 -- pictogram for LSP
        -- 'hrsh7th/cmp-vsnip',                    -- snippets plugin
        -- 'hrsh7th/vim-vsnip',                    -- snippets source for nvim-cmp
        'L3MON4D3/LuaSnip',                     -- snippets plugin
        'saadparwaiz1/cmp_luasnip',             -- snippets source for nvim-cmp
    }
    use 'SmiteshP/nvim-navic'                   -- statusline/winbar component using lsp
    use 'numToStr/Comment.nvim'                 -- code commenter
    use 'danymat/neogen'                        -- generate docstring

    -- Functional user interface
    use 'ryanoasis/vim-devicons'                -- extra icons without colors
    use 'kyazdani42/nvim-web-devicons'          -- extra icons with colors
    use 'olimorris/onedarkpro.nvim'             -- colorscheme
    use {                                       -- colorscheme
        'catppuccin/nvim',
        as = 'catppuccin',
    }
    use 'akinsho/bufferline.nvim'               -- buffer line (top)
    use 'nvim-lualine/lualine.nvim'             -- status line (bottom)
    use 'stevearc/dressing.nvim'                -- UI improvement for vim.ui.select and vim.ui.input
    use 'p00f/nvim-ts-rainbow'                  -- colorize parentheses

    -- Utilities
    use 'kyazdani42/nvim-tree.lua'              -- file explorer
    use 'simrat39/symbols-outline.nvim'         -- show symbols of the current buffer
    use {
        'nvim-telescope/telescope.nvim',        -- fuzzy finder for multiple things
        'nvim-telescope/telescope-bibtex.nvim', -- fuzzy finder for bibtex entries
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',  -- use fzf sorter for telescope
        run = 'make'
    }
    use 'RRethy/vim-illuminate'                 -- highlight related text under cursor
    use 'folke/todo-comments.nvim'              -- highlight and search TODO tags
    use 'lukas-reineke/indent-blankline.nvim'   -- show indent line
    use 'lewis6991/gitsigns.nvim'               -- git diff sign
    use 'goolord/alpha-nvim'                    -- start page greeter
    use 'Shatur/neovim-session-manager'         -- session manager
    use 'akinsho/toggleterm.nvim'               -- toggle terminal
    use 'andymass/vim-matchup'                  -- highlight and navigate sets of matching text
    use 'norcalli/nvim-colorizer.lua'           -- colorize color code

    -- Non-lua nvim plugins
    -- use {
    --     'kkoomen/vim-doge',                     -- generate docstring
    --     run=':call doge#install()',
    -- }
    use 'junegunn/vim-easy-align'               -- alignment plugin
    -- use 'liuchengxu/vista.vim'                  -- view and search for LSP symbols

    if first_run then
        packer.sync()
    end
end)

-- Show comments if the packer is installed for the first time
if first_run then
    print('==============================================')
    print('Plugins are being installed.')
    print('Wait until Packer completes then restart nvim.')
    print('==============================================')
    return
end
