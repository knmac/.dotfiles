-------------------------------------------------------------------------------
-- A fancy, configurable, notification manager
-- rcarriga/nvim-notify
-------------------------------------------------------------------------------
local ok, notify = pcall(require, 'notify')
if not ok then return end

notify.setup({
    top_down = false,
})

local map = function(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true, desc = 'DAP: ' .. desc }
    vim.keymap.set(mode, lhs, rhs, opts)
end
map('n', '<leader>n', function() notify.dismiss() end, 'Dismiss current notify message')
