require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "python",
    "c",
    "cpp",
    "bash",
    "latex",
    "json",
    "yaml",
    "html",
    "css"
  },
}
