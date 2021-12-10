-------------------------------------------------------------------------------
-- Status line at the bottom
-- nvim-lualine/lualine.nvim
-------------------------------------------------------------------------------
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'onedarkpro',
        --component_separators = {left='', right=''},
        --section_separators = {left='', right=''},
        component_separators = {left='', right=''},
        section_separators = {left='', right=''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            {
                'diff',
                colored=true,
                diff_color = {
                    added = { fg = "#98C379", },
                    modified = { fg = "#E5C07B", },
                    removed = { fg = "#E06C75", }
                },
                symbols = {added = '+', modified = '~', removed = '-'}
            },
            'diagnostics'
        },
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'nvim-tree', 'quickfix', 'fugitive'}
}
