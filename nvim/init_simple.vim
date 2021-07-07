source ~/.config/nvim/vim_plug_init.vim


" ============================================================================
" Active plugins
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
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

"source ~/.config/nvim/plugin_cfg/lightline.vim

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
