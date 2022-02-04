function! myspacevim#before() abort
    " fix eslint issue https://github.com/neomake/neomake/issues/2340
    let b:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
    let b:neomake_eslint_exe = b:eslint_exe
    let g:neomake_python_enabled_makers = ['flake8']
    " display file path
    let g:spacevim_enable_statusline_bfpath = 1
    set shell=fish
endfunction

function! myspacevim#after() abort
endfunction
