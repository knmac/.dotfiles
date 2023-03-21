-------------------------------------------------------------------------------
-- Bufferline on the top
-- akinsho/bufferline.nvim
-------------------------------------------------------------------------------
local ok, bufferline = pcall(require, 'bufferline')
if not ok then return end

-- Fallback for buffer deletion command
local bufdel_cmd = ''
if vim.fn.exists(':BufDel') > 0 then
    bufdel_cmd = 'BufDel %d'
else
    bufdel_cmd = 'bdelete! %d'
end

bufferline.setup({
    options = {
        close_command = bufdel_cmd,
        right_mose_command = bufdel_cmd,
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center',
                separator = true,
            }
        },
        -- separator_style = 'slant',
    },
    highlights = require('catppuccin.groups.integrations.bufferline').get(),
})
