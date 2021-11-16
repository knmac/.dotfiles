-------------------------------------------------------------------------------
-- Show indent lines
-- lukas-reineke/indent-blankline.nvim
-------------------------------------------------------------------------------
require('indent_blankline').setup {
    --char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"help", "startify", "make", "NvimTree", "dashboard", "lsp-installer", "alpha"},
    use_treesitter = true,
    --show_current_context = true,
}
