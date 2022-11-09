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
local dap_widgets_ok, dap_widgets = pcall(require, 'dap.ui.widgets')

-- Set up signs and colors
vim.fn.sign_define('DapBreakpoint',
    { text = '🛑', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition',
    { text = '🔶', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint',
    { text = '📜', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped',
    { text = '👀', texthl = '', linehl = 'debugPC', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected',
    { text = '🚫', texthl = '', linehl = '', numhl = '' })

-- Wrapper function to set keymaps with default opts
local map = function(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true, desc = 'DAP: ' .. desc }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Set up keymaps
if dapui_ok then
    map('n', ',d', function() dapui.toggle() end, 'Toggle UI')
end
if dap_widgets_ok then
    map('n', ',h', function() dap_widgets.hover() end, 'Check variable value on hover')
end
map('n', ',b', function() dap.toggle_breakpoint() end, 'Toggle breakpoint')
map('n', ',B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, 'Toggle breakpoint with condition')
map('n', ',c', function() dap.continue() end, 'Continue debugging')
map('n', ',r', function() dap.run() end, 'Run debugging')
map('n', ',l', function() dap.run_last() end, 'Run the last debug adapter entry')
map('n', ',n', function() dap.step_over() end, 'Step over')
map('n', ',i', function() dap.step_into() end, 'Step into')
map('n', ',o', function() dap.step_out() end, 'Step out')
map('n', ',t', function() dap.terminate() end, 'Terminate debugging')
