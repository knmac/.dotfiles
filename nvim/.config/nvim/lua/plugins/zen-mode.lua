-------------------------------------------------------------------------------
-- Distraction-free coding
-- folke/zen-mode.nvim
-------------------------------------------------------------------------------
local ok, zenmode = pcall(require, 'zen-mode')
if not ok then return end

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

zenmode.setup({
    window = {
        backdrop = 0.95,
        width = 150,
    },
    plugins = {
        kitty = {
            enabled = true,
            font = '+4',
        },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
        map('n', 'j', 'jzz', default_opts)
        map('n', 'k', 'kzz', default_opts)
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
        map('n', 'j', 'j', default_opts)
        map('n', 'k', 'k', default_opts)
    end,
})
