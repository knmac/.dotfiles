-------------------------------------------------------------------------------
-- Plugin manager
-- folke/lazy.nvim
-------------------------------------------------------------------------------
-- Bootstrap 1st install
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
local lazy = require('lazy')

local opts = {
    ui = {
        border = 'rounded',
    },
}

local plugins = {
    -- ------------------------------------------------------------------------
    -- Libraries and commonly required packages
    -- ------------------------------------------------------------------------
    'nvim-lua/plenary.nvim', -- ultilities used by many other plugins
    -- 'ryanoasis/vim-devicons', -- extra icons without colors

    -- ------------------------------------------------------------------------
    -- Functional user interface
    -- ------------------------------------------------------------------------
    {
        'catppuccin/nvim', -- colorscheme
        name = 'catppuccin',
    },
    {
        'akinsho/bufferline.nvim', -- buffer line (top)
        version = 'v3.*',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- extra icons with colors
            'ojroques/nvim-bufdel',        -- delete buffer while keeping the same layout
        },
    },
    {
        'nvim-lualine/lualine.nvim',                  -- status line (bottom)
        dependencies = 'nvim-tree/nvim-web-devicons', -- extra icons with colors
    },
    {
        'stevearc/dressing.nvim', -- UI improvement for vim.ui.select and vim.ui.input
        event = 'VeryLazy',
    },
    {
        'folke/noice.nvim',         -- UI improvement for messages, cmdline, and popupmenu
        dependencies = {
            'MunifTanjim/nui.nvim', -- UI Component Library for Neovim
            'rcarriga/nvim-notify', -- A fancy, configurable, notification manager
        },
    },

    -- ------------------------------------------------------------------------
    -- LSP and coding
    -- ------------------------------------------------------------------------
    'neovim/nvim-lspconfig',               -- language server protocol, must be placed after mason
    {
        'nvim-treesitter/nvim-treesitter', -- code parser generator for syntax highlighting
        build = ':TSUpdate',
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',                       -- :MasonUpdate updates registry contents
    },
    'williamboman/mason-lspconfig.nvim',              -- bridges mason.nvim and nvim-lspconfig
    {
        'jose-elias-alvarez/null-ls.nvim',            -- linter and formatter
        dependencies = 'jayp0521/mason-null-ls.nvim', -- bridges mason.nvim and null-ls
    },
    {
        'hrsh7th/nvim-cmp', -- code completion
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',                -- source for neovim's built-in language server client
            'hrsh7th/cmp-buffer',                  -- source for buffer words
            'hrsh7th/cmp-path',                    -- source for filesystem paths
            'hrsh7th/cmp-cmdline',                 -- source for vim's cmdline
            'hrsh7th/cmp-nvim-lsp-signature-help', -- source for displaying function signatures with the current parameter emphasized
            'hrsh7th/cmp-calc',                    -- source for math calculation
            'onsails/lspkind-nvim',                -- pictogram for LSP
            'L3MON4D3/LuaSnip',                    -- snippets plugin
            'saadparwaiz1/cmp_luasnip',            -- snippets source for nvim-cmp
            'rafamadriz/friendly-snippets',        -- Snippets collection for a set of different programming languages
        },
    },
    {
        'mfussenegger/nvim-dap',               -- debug adapter protocol
        dependencies = 'rcarriga/nvim-dap-ui', -- UI for nvim-dap
    },
    'SmiteshP/nvim-navic',                     -- statusline/winbar component using lsp
    'numToStr/Comment.nvim',                   -- code commenter
    'danymat/neogen',                          -- generate docstring

    -- ------------------------------------------------------------------------
    -- Utilities
    -- ------------------------------------------------------------------------
    {
        'nvim-telescope/telescope.nvim',                    -- fuzzy finder for multiple things
        dependencies = {
            'nvim-telescope/telescope-bibtex.nvim',         -- fuzzy finder for bibtex entries
            'nvim-telescope/telescope-file-browser.nvim',   -- file browser extension
            {
                'nvim-telescope/telescope-fzf-native.nvim', -- use fzf sorter for telescope
                build = 'make',
            },
        }
    },
    'kyazdani42/nvim-tree.lua',            -- file explorer
    'simrat39/symbols-outline.nvim',       -- show symbols of the current buffer
    'RRethy/vim-illuminate',               -- highlight related text under cursor
    'folke/todo-comments.nvim',            -- highlight and search TODO tags
    'folke/which-key.nvim',                -- display a popup with possible key bindings
    'folke/zen-mode.nvim',                 -- distraction-free coding
    'nvim-zh/colorful-winsep.nvim',        -- highlight the current window
    'lukas-reineke/indent-blankline.nvim', -- show indent line
    'lewis6991/gitsigns.nvim',             -- git diff sign
    'goolord/alpha-nvim',                  -- start page greeter
    'Shatur/neovim-session-manager',       -- session manager
    'akinsho/toggleterm.nvim',             -- toggle terminal
    'andymass/vim-matchup',                -- highlight and navigate sets of matching text
    'HiPhish/nvim-ts-rainbow2',            -- colorize parentheses
    'norcalli/nvim-colorizer.lua',         -- colorize color code

    -- ------------------------------------------------------------------------
    -- Non-lua nvim plugins
    -- ------------------------------------------------------------------------
    'junegunn/vim-easy-align', -- alignment plugin
    'fladson/vim-kitty',       -- syntax highlighting for kitty
}

lazy.setup(plugins, opts)
