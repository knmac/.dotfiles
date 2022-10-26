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
        name = 'Default python launcher',
        program = '${file}', -- This configuration will launch the current file if used.
    },
}

local opts = { noremap = true, silent = true }
local dap_widgets = require('dap.ui.widgets')

-- Set up signs and colors
vim.fn.sign_define('DapBreakpoint',
    { text = '🔴', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition',
    { text = '🟢', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint',
    { text = '📜', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',
    { text = '👀', texthl = '', linehl = 'debugPC', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected',
    { text = '🟠', texthl = '', linehl = '', numhl = '' })

-- Set up keymaps
vim.keymap.set(
    'n', ',d', function() dapui.toggle() end,
    { desc = 'Toggle DAP UI' }, opts)
vim.keymap.set(
    'n', ',b', function() dap.toggle_breakpoint() end,
    { desc = 'Toggle DAP breakpoint' }, opts)
vim.keymap.set(
    'n', ',B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = 'Toggle DAP breakpoint with condition' }, opts)
vim.keymap.set(
    'n', ',c', function() dap.continue() end,
    { desc = 'Continue debugging' }, opts)
vim.keymap.set(
    'n', ',r', function() dap.run() end,
    { desc = 'Run debugging' }, opts)
vim.keymap.set(
    'n', ',l', function() dap.run_last() end,
    { desc = 'Run the last debug adapter entry' }, opts)
vim.keymap.set(
    'n', ',n', function() dap.step_over() end,
    { desc = 'Step over' }, opts)
vim.keymap.set(
    'n', ',i', function() dap.step_into() end,
    { desc = 'Step into' }, opts)
vim.keymap.set(
    'n', ',o', function() dap.step_out() end,
    { desc = 'Step out' }, opts)
vim.keymap.set(
    'n', ',t', function() dap.terminate() end,
    { desc = 'Terminate debugging' }, opts)
vim.keymap.set(
    'n', ',h', function() dap_widgets.hover() end,
    { desc = 'Hover' }, opts)
