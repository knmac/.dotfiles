-------------------------------------------------------------------------------
-- Code linter and formatter
-- jose-elias-alvarez/null-ls.nvim
-- builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-------------------------------------------------------------------------------
local servers = { 'pylama', 'black', 'cpplint', 'shellcheck' }

-- Install the linter and formatter servers automatically using mason-null-ls
local mason_ok, _ = pcall(require, 'mason')
if not mason_ok then return end

local mason_nullls_ok, mason_nullls = pcall(require, 'mason-null-ls')
if not mason_nullls_ok then return end
mason_nullls.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Init for null-ls
local ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

null_ls.setup({
    debug = true,
    sources = {
        -- Formatting
        formatting.black.with({  -- Python formatter
            extra_args = {'--fast',},
        }),
        -- Non-LSP diagnostics (linters)
        diagnostics.pylama.with({  -- Python linter
            extra_args = {
                '-l', 'pycodestyle',  -- use pycodestyle as flake8 duplicates many things from pyright
                '--max-line-length', '100',
                '--ignore', 'E226,E402,W503,W504,W391',
            }
        }),
        diagnostics.cpplint,  -- C/C++ linter
        diagnostics.shellcheck,  -- Shell script linter
        -- Completion
        -- completion.spell,  -- Spell suggestion
    },
})
