require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,  -- treesitter's indent is buggy
        disable = {},
    },
    ensure_installed = {
        "python",
        "c",
        "cpp",
        "bash",
        "latex",
        "bibtex",
        "json",
        "yaml",
        "html",
        "css",
        "lua",
        "cmake",
        "dockerfile"
    },
    matchup = {
        enable = true,
    },
}
