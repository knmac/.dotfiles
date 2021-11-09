local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     dashboard.button( "f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
--     dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
--     dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--     dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
-- }

-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  Edit new file"        , ":ene<CR>"),
--     dashboard.button( "r", "  Recently opened files", ":History<CR>"),
--     dashboard.button( "f", "  File finder"          , ":Files<CR>"),
--     dashboard.button( "w", "  Word finder"          , ":Rg<CR>"),
--     dashboard.button( "c", "  Color schemes"        , ":Colors<CR>"),
--     dashboard.button( "u", "  Update plugins"       , ":PlugUpdate<CR>"),
--     dashboard.button( "s", "  Settings"             , ":e $MYVIMRC<CR>"),
--     dashboard.button( "q", "  Quit"                 , ":qa<CR>"),
-- }

dashboard.section.buttons.val = {
    dashboard.button( "e", "  Edit new file"        , ":ene<CR>"),
    dashboard.button( "r", "  Recently opened files", ":Telescope oldfiles<CR>"),
    dashboard.button( "f", "  File finder"          , ":Telescope find_files<CR>"),
    dashboard.button( "w", "  Word finder"          , ":Telescope live_grep<CR>"),
    dashboard.button( "c", "  Color schemes"        , ":Telescope colorscheme<CR>"),
    dashboard.button( "u", "  Update plugins"       , ":PlugUpdate<CR>"),
    dashboard.button( "s", "  Settings"             , ":e $MYVIMRC<CR>"),
    dashboard.button( "q", "  Quit"                 , ":qa<CR>"),
}

-- Set footer
local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
