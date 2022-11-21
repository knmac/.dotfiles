-------------------------------------------------------------------------------
-- Distraction-free coding
-- folke/zen-mode.nvim
-------------------------------------------------------------------------------
local ok, zenmode = pcall(require, 'zen-mode')
if not ok then return end

zenmode.setup({
    window = {
        backdrop = 1.0,
        width = 120,
    },
    plugins = {
        kitty = {
            enabled = true,
            font = '+4',
        },
    },
})
