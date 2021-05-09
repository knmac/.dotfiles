" Force to use flake8
let g:ale_linters = {
            \'python': ['flake8'],
            \}
let g:ale_python_flake8_options = '--ignore=E501,E402,E226'
" E501 : line too long
" E402 : module level import not at top of file
" E226 : arithmetic spacing

" Change message format
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str    = 'I'
let g:ale_echo_msg_format      = '[%linter%] %code%: %s [%severity%]'

" Use quickfix list instead of location list
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 1

" Press <F9> to toggle quickfix list
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open == 1
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

