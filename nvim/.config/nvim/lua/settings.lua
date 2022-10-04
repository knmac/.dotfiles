-------------------------------------------------------------------------------
-- Neovim settings
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Neovim API aliases
-------------------------------------------------------------------------------
-- local map = vim.api.nvim_set_keymap  -- set global keymap
-- local cmd = vim.cmd                 -- execute Vim commands
-- local exec = vim.api.nvim_exec      -- execute Vimscript
-- local fn = vim.fn                   -- call Vim functions
local g = vim.g                     -- global variables
local opt = vim.opt                 -- global/buffer/windows-scoped options

local user_group = vim.api.nvim_create_augroup('user_group', { clear = false })


-------------------------------------------------------------------------------
-- Setup python path
-------------------------------------------------------------------------------
local possible_python_paths = {
    -- Extend the list for possible python path. Will use the 1st possible one
    os.getenv('HOME')..'/.local/anaconda3/envs/dev/bin/python',
    os.getenv('HOME')..'/anaconda3/envs/dev/bin/python',
    os.getenv('HOME')..'/opt/anaconda3/envs/dev/bin/python',
}
for _, python_path in pairs(possible_python_paths) do
    if io.open(python_path, 'r') ~= nil then
        g.python3_host_prog = python_path
        break
    end
end


-------------------------------------------------------------------------------
-- Deactivate unused providers
-------------------------------------------------------------------------------
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0


-------------------------------------------------------------------------------
-- General
-------------------------------------------------------------------------------
-- g.mapleader = ','                -- change leader to a comma
opt.mouse = 'a'                     -- enable mouse support
opt.clipboard = 'unnamedplus'       -- copy/paste to system clipboard
opt.swapfile = false                -- don't use swapfile
opt.encoding = 'utf-8'              -- use Unicode
opt.wildmenu = true                 -- enhance mode of command-line completion
opt.wildmode = 'longest:full,full'  -- completion mode config
opt.backspace = 'indent,eol,start'  -- resolve the problem that backspace not working

vim.cmd [[ set path+=** ]]              -- provide tab-completion for file-related tasks


-------------------------------------------------------------------------------
-- Neovim UI
-------------------------------------------------------------------------------
opt.termguicolors = true            -- enable 24-bit RGB color in the TUI
opt.ls = 2                          -- always show status bar
opt.number = true                   -- show line number
opt.relativenumber = true           -- use relative number
opt.numberwidth = 5                 -- width of line numbers
opt.showcmd = true                  -- show command in bottom bar
opt.cursorline = true               -- highlight current line
opt.colorcolumn = '80'              -- line length marker at 80 columns
opt.showmatch = true                -- highlight matching parenthesis
opt.smartcase = true                -- ignore lowercase for the whole pattern
opt.linebreak = true                -- wrap on word boundary
opt.signcolumn = 'yes'              -- always show the sign column to not shift the text

-- Marking special characters
opt.list = true                     -- list mode to mark special characters
opt.listchars='tab:>-,trail:.'      -- mark <Tab> as >-, trailing <Space> as .

-- Splitting
opt.splitright = true               -- vertical split to the right
opt.splitbelow = true               -- orizontal split to the bottom

-- Folding
opt.foldenable = true               -- enable folding
opt.foldlevelstart = 10             -- open most folds by default
opt.foldnestmax = 10                -- 10 nested fold max
opt.foldmethod = 'indent'           -- set folding method by looking at indent

-- Only show cursorline in active windows
vim.api.nvim_create_autocmd('WinEnter', {
    group = user_group,
    callback = function() vim.opt_local.cursorline = true end,
})
vim.api.nvim_create_autocmd('WinLeave', {
    group = user_group,
    callback = function() vim.opt_local.cursorline = false end,
})


-------------------------------------------------------------------------------
-- Highlight
-------------------------------------------------------------------------------
-- vim.cmd [[
-- highlight CursorLine cterm=bold   gui=bold
-- highlight Comment    cterm=italic gui=italic
-- highlight String     cterm=italic gui=italic
-- ]]


-------------------------------------------------------------------------------
-- Searching and substitution
-------------------------------------------------------------------------------
opt.ignorecase = true               -- ignore case letters when search
opt.incsearch = true                -- search as characters are entered
opt.hlsearch = true                 -- highlight matches
-- opt.inccommand = 'nosplit'          -- show substitution results live


-------------------------------------------------------------------------------
-- Memory, CPU
-------------------------------------------------------------------------------
opt.hidden = true                   -- enable background buffers
opt.history = 100                   -- remember n lines in history
opt.lazyredraw = true               -- faster scrolling
opt.synmaxcol = 240                 -- max column for syntax highlight


-------------------------------------------------------------------------------
-- Tabs, indent
-------------------------------------------------------------------------------
opt.expandtab = true                -- use spaces instead of tabs
opt.tabstop = 4                     -- change the width of the <Tab> key
opt.softtabstop = 4                 -- affect what happens when press <Tab> or <BS>
opt.shiftwidth = 4                  -- affect what happens when press >>, <<, or ==
opt.smarttab = true                 -- affects how <Tab> are interpreted based on cursor location
opt.autoindent = true               -- copy the indent from the prev line to a new line

-- Make sure colons do not mess up the indent in Python
vim.cmd [[
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:
]]

-- Use tab instead of space for make files
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Use tab instead of space for make files',
    pattern = { 'make' },
    group = user_group,
    callback = function() vim.opt_local.expandtab = false end,
})

-- 2 spaces for these file types
vim.api.nvim_create_autocmd('FileType', {
    desc = '2 spaces for these files types',
    pattern = { 'xml', 'html', 'c', 'cpp', 'h', 'hpp' },
    group = user_group,
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
