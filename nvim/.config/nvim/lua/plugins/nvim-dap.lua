-------------------------------------------------------------------------------
-- Debug adapter protocol
-- mfussenegger/nvim-dap
-------------------------------------------------------------------------------
-- local servers = { 'debugpy' }

-- Set up UI
local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then return end
dapui.setup()

-- Init for DAP
local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then return end

dap.adapters.python = {
    type = 'executable',
    command = vim.g.python3_host_prog,
    args = { '-m', 'debugpy.adapter', },
}

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}', -- This configuration will launch the current file if used.
    },
}

local opts = { noremap = true, silent = true }
local dap_widgets = require('dap.ui.widgets')

vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '🟢', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📜', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '👀', texthl = '', linehl = 'debugPC', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟠', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', ',d', function() dapui.toggle() end, {})
vim.keymap.set('n', ',b', function() dap.toggle_breakpoint() end, opts)
vim.keymap.set('n', ',B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
vim.keymap.set('n', ',c', function() dap.continue() end, opts)
vim.keymap.set('n', ',r', function() dap.run() end, opts)
vim.keymap.set('n', ',l', function() dap.run_last() end, opts)
vim.keymap.set('n', ',n', function() dap.step_over() end, opts)
vim.keymap.set('n', ',i', function() dap.step_into() end, opts)
vim.keymap.set('n', ',o', function() dap.step_out() end, opts)
vim.keymap.set('n', ',t', function() dap.terminate() end, opts)
vim.keymap.set('n', ',h', function() dap_widgets.hover() end, opts)
