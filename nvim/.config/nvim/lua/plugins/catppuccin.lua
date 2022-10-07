-------------------------------------------------------------------------------
-- Catpuccin colorscheme
-- catppuccin/nvim
-------------------------------------------------------------------------------
local ok, catppuccin = pcall(require, 'catppuccin')
if not ok then return end


vim.g.catppuccin_flavour = 'macchiato' -- latte, frappe, macchiato, mocha

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
    },
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = {},
        keywords = {},
        strings = { 'italic' },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        ts_rainbow = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        navic = {
            enabled = true,
            custom_bg = 'NONE',
        },
    }
})

vim.api.nvim_command('colorscheme catppuccin')
