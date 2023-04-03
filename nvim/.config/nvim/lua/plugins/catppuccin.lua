-------------------------------------------------------------------------------
-- Catpuccin colorscheme
-- catppuccin/nvim
-------------------------------------------------------------------------------
local ok, catppuccin = pcall(require, 'catppuccin')
if not ok then return end


catppuccin.setup({
    flavour = 'macchiato', -- latte, frappe, macchiato, mocha
    transparent_background = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
    },
    styles = {
        comments = { 'italic' },
        conditionals = { 'bold' },
        loops = { 'bold' },
        functions = { 'bold', 'italic' },
        keywords = { 'bold', 'italic' },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        barbar = true,
        cmp = true,
        gitsigns = true,
        noice = true,
        notify = true,
        nvimtree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        ts_rainbow2 = true,
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        navic = {
            enabled = true,
            custom_bg = 'NONE',
        },
        dap = {
            enabled = true,
            enable_ui = true, -- enable nvim-dap-ui
        },
    }
})

vim.cmd.colorscheme('catppuccin')
vim.cmd.highlight('DiagnosticUnderlineError gui=undercurl')  -- use undercurl for error, if supported by terminal
