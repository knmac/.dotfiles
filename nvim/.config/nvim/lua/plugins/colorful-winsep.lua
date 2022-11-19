-------------------------------------------------------------------------------
-- Highlight the current window
-- nvim-zh/colorful-winsep.nvim
-------------------------------------------------------------------------------
local ok, winsep = pcall(require, 'colorful-winsep')
if not ok then return end

winsep.setup({
    no_exec_files = {
        'packer', 'TelescopePrompt', 'mason', 'CompetiTest', 'NvimTree',
        'Outline', 'toggleterm'
    },
})
