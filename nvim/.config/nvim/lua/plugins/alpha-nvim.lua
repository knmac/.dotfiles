-------------------------------------------------------------------------------
-- Start page greeter
-- goolord/alpha-nvim
-------------------------------------------------------------------------------
local ok, alpha = pcall(require, 'alpha')
if not ok then return end

local dashboard = require('alpha.themes.dashboard')

-- Create Dictionary file if necessary
local Path = require('plenary.path')
Path:new(vim.fn.stdpath('data') .. '/spelling'):mkdir()
Path:new(vim.fn.stdpath('data') .. '/spelling/en-US.txt'):touch()

-- Get version
local function get_version()
    local version = vim.version()
    local nvim_version_info = 'NVIM v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
    return nvim_version_info
end

-- Set header
dashboard.section.header.val = {
    '   ██╗  ██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗  ',
    '   ██║ ██╔╝████╗  ██║██║   ██║██║████╗ ████║  ',
    '   █████╔╝ ██╔██╗ ██║██║   ██║██║██╔████╔██║  ',
    '   ██╔═██╗ ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ',
    '   ██║  ██╗██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ',
    '   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ',
}

dashboard.section.buttons.val = {
    dashboard.button( 'e', '  Edit a new file'      , ':ene<CR>'),
    dashboard.button( 's', '  Session manager'      , ':SessionManager load_session<CR>'),
    dashboard.button( 'r', '  Recently opened files', ':Telescope oldfiles<CR>'),
    dashboard.button( 'f', '  File finder'          , ':Telescope find_files<CR>'),
    dashboard.button( 't', '  Text finder'          , ':Telescope live_grep<CR>'),
    dashboard.button( 'u', '  Update plugins'       , ':PackerSync<CR>'),
    dashboard.button( 'd', '﬜  Dictionary'           , ':cd $HOME/.local/share/nvim/ | e spelling/en-US.txt<CR>'),
    dashboard.button( 'c', '  Configurations'       , ':cd $HOME/.config/nvim | e $MYVIMRC<CR>'),
    dashboard.button( 'h', '  Cheatsheet'           , ':e $HOME/.dotfiles/cheatsheets/nvim_cheatsheet.md | SymbolsOutlineOpen<CR>'),
    dashboard.button( 'q', '  Quit'                 , ':qa<CR>'),
}

-- Set footer
local fortune = require('alpha.fortune')
dashboard.section.footer.val = fortune()

-- Dynamic header padding (center of the page)
local min_padding = 2
-- local margin_top_percent = 0.2
-- local header_padding = vim.fn.max({ min_padding, vim.fn.floor(vim.fn.winheight(0) * margin_top_percent) })
local page_len = #dashboard.section.header.val + 1 + min_padding +
                 2*#dashboard.section.buttons.val + #dashboard.section.footer.val
local header_padding = vim.fn.max({min_padding, vim.fn.floor((vim.fn.winheight(0) - page_len) / 2)})

-- Set layout
dashboard.config.layout = {
    { type = 'padding', val = header_padding },
    dashboard.section.header,
    { type = 'text', val = get_version(), opts = {position = 'center', hl = 'hl_group'} },
    { type = 'padding', val = min_padding },
    dashboard.section.buttons,
    dashboard.section.footer,
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd[[
    autocmd FileType alpha setlocal nofoldenable
]]
