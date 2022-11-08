-------------------------------------------------------------------------------
-- Debug adapter protocol
-- mfussenegger/nvim-dap
-------------------------------------------------------------------------------
-- local servers = { 'debugpy' }

-- Init DAP-UI
local dapui_ok, dapui = pcall(require, 'dapui')
if not dapui_ok then return end
dapui.setup()

-- Init for DAP
local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then return end

-- Configurations for each languages ------------------------------------------
dap.adapters.python = {
    type = 'executable',
    command = vim.g.python3_host_prog,
    args = { '-m', 'debugpy.adapter', },
}
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch DAP for the current file',
        -- console = 'integratedTerminal',
        program = '${file}',
        cwd = '${workspaceFolder}',
        args = {},
    },
    {
        type = 'python',
        request = 'launch',
        name = 'Launch DAP with file selection',
        -- console = 'integratedTerminal',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        args = {},
    },
}

-- Setup UI -------------------------------------------------------------------
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
    { desc = 'DAP: Toggle UI' }, opts)
vim.keymap.set(
    'n', ',b', function() dap.toggle_breakpoint() end,
    { desc = 'DAP: Toggle breakpoint' }, opts)
vim.keymap.set(
    'n', ',B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = 'DAP: Toggle breakpoint with condition' }, opts)
vim.keymap.set(
    'n', ',c', function() dap.continue() end,
    { desc = 'DAP: Continue debugging' }, opts)
vim.keymap.set(
    'n', ',r', function() dap.run() end,
    { desc = 'DAP: Run debugging' }, opts)
vim.keymap.set(
    'n', ',l', function() dap.run_last() end,
    { desc = 'DAP: Run the last debug adapter entry' }, opts)
vim.keymap.set(
    'n', ',n', function() dap.step_over() end,
    { desc = 'DAP: Step over' }, opts)
vim.keymap.set(
    'n', ',i', function() dap.step_into() end,
    { desc = 'DAP: Step into' }, opts)
vim.keymap.set(
    'n', ',o', function() dap.step_out() end,
    { desc = 'DAP: Step out' }, opts)
vim.keymap.set(
    'n', ',t', function() dap.terminate() end,
    { desc = 'DAP: Terminate debugging' }, opts)
vim.keymap.set(
    'n', ',h', function() dap_widgets.hover() end,
    { desc = 'DAP: Check variable value on hover' }, opts)
