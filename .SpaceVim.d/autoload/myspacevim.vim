function! myspacevim#before() abort
    " fix eslint issue https://github.com/neomake/neomake/issues/2340
    let g:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
    let g:neomake_eslint_exe = g:eslint_exe
    let g:neomake_python_enabled_makers = ['flake8']
    let g:neomake_javascript_jsx_enabled_makers = ['eslint']
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_javascriptreact_enabled_makers = ['eslint']
    let g:neomake_typescript_enabled_makers = ['eslint']
    let g:neomake_typescriptreact_enabled_makers = ['eslint']
    let g:neoformat_try_node_exe = 1
    " display file path
    let g:spacevim_enable_statusline_bfpath = 1
    " set shell=fish
    " volta not runnign well https://github.com/volta-cli/volta/issues/866
    if executable('volta')
      let g:node_host_prog = trim(system("volta which neovim-node-host"))
    endif
    " lazygit config
    call SpaceVim#custom#SPC('nore', ['g', 'l'], 'FloatermNew lazygit', 'LazyGit', 1)
    call SpaceVim#custom#SPC('nore', ['g', 'h', 'c'], 'FloatermNew gh pr create', 'gh pr create', 1)
    " Jest for javascript
    let g:test#javascript#runner = 'jest'
    let test#strategy = 'dispatch_background'
    let g:ultest_fail_sign = '✘'
    let g:ultest_running_sign = '🔄'
    " search config
    set smartcase
    set ignorecase
    " code action mapping Shift+Option+Enter
    nnoremap <silent> <M-CR> :lua vim.lsp.buf.code_action()<CR>
    " open diagnostic floating window
    nnoremap <silent> <M-D> :lua vim.diagnostic.open_float()<CR>
    " COC
    let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver']
    " yank to clipboard
    set clipboard+=unnamedplus
    " floatterm plugin config
    let g:floaterm_width = 0.9
    let g:floaterm_height = 0.9
    let g:floaterm_autoclose = 1
endfunction

function! myspacevim#after() abort
    " typescript react prettier config
    let g:neoformat_typescriptreact_prettier = {
      \ 'exe': 'node_modules/.bin/prettier',
      \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript'],
      \ 'stdin': 1,
      \ 'try_node_exe': 1,
    \ }
    let g:neoformat_enabled_typescriptreact = ['prettier']
    " github
    let g:github_dashboard = { 'username': 'mikaoelitiana', 'password': $GITHUB_TOKEN }

endfunction

function! SpaceVim#layers#core#statusline#get(...) abort
endfunction

