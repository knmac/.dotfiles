-------------------------------------------------------------------------------
-- Bufferline on the top
-- akinsho/bufferline.nvim
-------------------------------------------------------------------------------
-- vim.opt.termguicolors = true

require('bufferline').setup({
    options = {
        offsets = { {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = false,
        } },
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
    }
})
