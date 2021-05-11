" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'

call plug#end()

" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" ============================================================================
" Basic configurations
colorscheme gruvbox

source ~/.config/nvim/plugin_cfg/basic.vim
source ~/.config/nvim/plugin_cfg/netrw.vim
source ~/.config/nvim/plugin_cfg/snippet.vim

source ~/.config/nvim/plugin_cfg/lightline.vim

" ============================================================================
" Key bindings

" Toggle Netrw
nnoremap <silent> <F3> :call ToggleNetrw()<CR>

" Show buffer list
nnoremap <silent> <F5> :buffers<CR>:buffer<Space>

" Prev buffer
nnoremap <silent> <F6> :bp<CR>

" Next buffer
nnoremap <silent> <F7> :bn<CR>

" Close buffer and switch to the previous one
nnoremap <silent> <F8> :bp<CR>:bd #<CR>

" Run the make file
nnoremap <silent> <F10> :make<CR>
