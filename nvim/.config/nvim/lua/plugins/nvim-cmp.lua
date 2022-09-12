-------------------------------------------------------------------------------
-- Code completion
-- hrsh7th/nvim-cmp
--
-- Ref: for snippet:
-- https://github.com/neovim/nvim-lspconfig/wiki/Snippets
-- https://raw.githubusercontent.com/L3MON4D3/LuaSnip/master/Examples/snippets.lua
-------------------------------------------------------------------------------
local cmp = require('cmp')
-- local luasnip = require('luasnip')

-- -- Navigate to the next item in the list
-- local next_item = function(fallback)
--     if cmp.visible() then
--         cmp.select_next_item()
--     elseif luasnip.expand_or_jumpable() then
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
--     else
--         fallback()
--     end
-- end

-- -- Navigate to the next item in the list
-- local prev_item = function(fallback)
--     if cmp.visible() then
--         cmp.select_prev_item()
--     elseif luasnip.jumpable(-1) then
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
--     else
--         fallback()
--     end
-- end

-- Main config
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
        -- ['<Tab>'] = next_item,
        -- ['<S-Tab>'] = prev_item,
        -- ['<C-n>'] = next_item,
        -- ['<C-p>'] = prev_item,
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'calc' },
    }),
    formatting = {
        format = require('lspkind').cmp_format(),
    },
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--     })
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
    })
})
