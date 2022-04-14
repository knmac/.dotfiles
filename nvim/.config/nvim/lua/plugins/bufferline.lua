-------------------------------------------------------------------------------
-- Bufferline on the top
-- akinsho/bufferline.nvim
-------------------------------------------------------------------------------
-- vim.opt.termguicolors = true

require('bufferline').setup({
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        separator_style = 'slant',
    }
})
