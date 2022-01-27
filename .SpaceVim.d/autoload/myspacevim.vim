function! myspacevim#before() abort
    " fix eslint issue https://github.com/neomake/neomake/issues/2340
    let b:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
    let b:neomake_eslint_exe = b:eslint_exe
    let g:neomake_python_enabled_makers = ['flake8']


endfunction

function! myspacevim#after() abort
endfunction
