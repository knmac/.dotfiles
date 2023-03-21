-------------------------------------------------------------------------------
-- UI improvement for messages, cmdline, and popupmenu
-- folke/noice.nvim
-------------------------------------------------------------------------------
local ok, noice = pcall(require, 'noice')
if not ok then return end

-- Only use the lsp rendering feature, deactivate everything else
noice.setup({
    -- Turn off cmdline, messages, popupmenu, and notify for the default behavior
    cmdline = { enabled = true, },
    messages = { enabled = true, },
    popupmenu = { enabled = true, },
    notify = { enabled = true, },
    -- Setup LSP for prettier rendering
    lsp = {
        progress = {
            enabled = false,
        },
        override = {
            -- override the default lsp markdown formatter with Noice
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            -- override the lsp markdown formatter with Noice
            ['vim.lsp.util.stylize_markdown'] = true,
            -- override cmp documentation with Noice (needs the other options to work)
            ['cmp.entry.get_documentation'] = true,
        },
        -- Let nvim-cmp handle hover and signature
        hover = {
            enabled = false,
        },
        signature = {
            enabled = false,
        },
        message = {
            enabled = true,
        },
    },
})

vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = nil })
