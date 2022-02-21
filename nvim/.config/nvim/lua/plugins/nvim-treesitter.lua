-------------------------------------------------------------------------------
-- Code parser generator for syntax highlighting
-- nvim-treesitter/nvim-treesitter
-------------------------------------------------------------------------------
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,  -- treesitter's indent is buggy
        disable = {},
    },
    ensure_installed = {
        "python",
        "c",
        "cpp",
        "bash",
        "latex",
        "bibtex",
        "json",
        "yaml",
        "html",
        "css",
        "lua",
        "cmake",
        "dockerfile"
    },
    matchup = {
        enable = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
})
