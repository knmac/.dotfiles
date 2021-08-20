require("indent_blankline").setup {
    --char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"help", "startify", "make", "NvimTree"},
    use_treesitter = true,
}
