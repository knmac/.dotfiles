-------------------------------------------------------------------------------
-- Status line at the bottom
-- nvim-lualine/lualine.nvim
-------------------------------------------------------------------------------
local ok, lualine = pcall(require, 'lualine')
if not ok then return end

local navic_ok, navic = pcall(require, 'nvim-navic')
local winbar_cfg = {}
local inactive_winbar_cfg = {}
if navic_ok then
    winbar_cfg = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { 'filename', path = 1, color = { bg = 'NONE' } },
            { navic.get_location, cond = navic.is_available },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
    inactive_winbar_cfg = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { 'filename', path = 1, color = { bg = 'NONE' } },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        --component_separators = {left='', right=''},
        --section_separators = {left='', right=''},
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {
                'NvimTree',
                'Outline',
                'toggleterm',
                'alpha',
                'dap-repl',
                'packer',
            },
        },
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 3, } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = winbar_cfg,
    inactive_winbar = inactive_winbar_cfg,
    extensions = { 'nvim-tree', 'quickfix', 'fugitive', 'symbols-outline', 'toggleterm', 'nvim-dap-ui' }
})
