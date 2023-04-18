-------------------------------------------------------------------------------
-- Package manager for LSP, DAP, linters, and formatter
-- williamboman/mason.nvim
-------------------------------------------------------------------------------
local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

mason.setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
        check_outdated_packages_on_open = true,
    }
})
