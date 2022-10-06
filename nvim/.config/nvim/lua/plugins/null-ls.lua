-------------------------------------------------------------------------------
-- Code linter and formatter
-- jose-elias-alvarez/null-ls.nvim
-- builtins: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-------------------------------------------------------------------------------
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
    on_init = function(new_client, _)  -- Resolve multiple offset_encoding in clangd of nvim_lsp
        new_client.offset_encoding = 'utf-8'
    end,
})
