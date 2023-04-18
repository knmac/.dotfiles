-------------------------------------------------------------------------------
-- Statusline/winbar component using lsp
-- SmiteshP/nvim-navic
-------------------------------------------------------------------------------
local ok, navic = pcall(require, 'nvim-navic')
if not ok then return end

navic.setup {
    highlight = true,
    separator = ' › ',
    -- VScode-like icons
    icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
    }
}
