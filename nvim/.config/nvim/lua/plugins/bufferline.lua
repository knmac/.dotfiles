-------------------------------------------------------------------------------
-- Bufferline on the top
-- akinsho/bufferline.nvim
-------------------------------------------------------------------------------
-- vim.opt.termguicolors = true

require('bufferline').setup({
    options = {
        offsets = { {
            filetype = 'NvimTree',
            text = 'EXPLORER',
            text_align = 'center',
            padding = 0,
        } },
        separator_style = 'slant',
    }
})
