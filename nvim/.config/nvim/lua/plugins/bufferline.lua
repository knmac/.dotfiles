-------------------------------------------------------------------------------
-- Bufferline on the top
-- akinsho/bufferline.nvim
-------------------------------------------------------------------------------
local ok, bufferline = pcall(require, 'bufferline')
if not ok then return end

-- vim.opt.termguicolors = true
bufferline.setup({
    options = {
        close_command = 'BufDel %d',
        right_mose_command = 'BufDel %d',
        offsets = { {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = false,
        } },
        -- separator_style = 'slant',
        diagnostics = 'nvim_lsp',
    }
})
