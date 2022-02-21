-------------------------------------------------------------------------------
-- Code completion
-- hrsh7th/nvim-cmp
--
-- Ref: for snippet:
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets
-- https://raw.githubusercontent.com/L3MON4D3/LuaSnip/master/Examples/snippets.lua
-------------------------------------------------------------------------------
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            --vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    },
    sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
        --{ name = 'vsnip' },

        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    },
    formatting = {
        format = require'lspkind'.cmp_format(),
    },
    documentation = {
        border = 'single',
    },
})
