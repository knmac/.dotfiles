require("indent_blankline").setup {
    --char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"help", "startify", "make"},
    use_treesitter = true,
}
