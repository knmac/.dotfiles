-------------------------------------------------------------------------------
-- Debugger adapter protocol
-- mfussenegger/nvim-dap
-------------------------------------------------------------------------------
local servers = { 'debugpy' }

-- Install the linter and formatter servers automatically using mason-null-ls
local mason_ok, _ = pcall(require, 'mason')
if not mason_ok then return end

local mason_dap_ok, mason_dap = pcall(require, 'mason-nvim-dap')
if not mason_dap_ok then return end
mason_dap.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Init for DAP
local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then return end

mason_dap.setup_handlers({
    function(source_name)
        -- all sources with no handler get passed here
    end,

    python = function()
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
    end,
})
