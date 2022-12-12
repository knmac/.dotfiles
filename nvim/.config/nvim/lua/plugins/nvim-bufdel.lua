-------------------------------------------------------------------------------
-- Delete buffer while keeping the same layout
-- ojroques/nvim-bufdel
-------------------------------------------------------------------------------
local ok, bufdel = pcall(require, 'bufdel')
if not ok then return end

bufdel.setup {
    next = 'cycle',  -- or 'cycle, 'alternate', 'tab'
    quit = false,    -- quit Neovim when last buffer is closed
}
