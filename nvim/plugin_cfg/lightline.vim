set showtabline=2
"set laststatus=2

let g:lightline = {
\   'colorscheme': 'deus',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'component': {
\     'lineinfo': ' %3l:%-2v',
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   },
\   'tabline': {
\     'left': [ ['buffers'] ],
\     'right': [ ['close'] ]
\   },
\   'component_expand': {
\     'buffers': 'lightline#bufferline#buffers'
\   },
\   'component_type': {
\     'buffers': 'tabsel'
\   }
\ }
"let g:lightline.separator = {
"\   'left': '', 'right': ''
"\}
"let g:lightline.subseparator = {
"\   'left': '', 'right': '' 
"\}

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#number_separator = ':'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#clickable = 1
let g:lightline.component_raw = {'buffers': 1}
