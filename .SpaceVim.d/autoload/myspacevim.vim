function! myspacevim#before() abort
    " fix eslint issue https://github.com/neomake/neomake/issues/2340
    let g:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
    let g:neomake_eslint_exe = g:eslint_exe
    let g:neomake_python_enabled_makers = ['flake8']
    let g:neomake_javascript_jsx_enabled_makers = ['eslint']
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neoformat_try_node_exe = 1
    " display file path
    let g:spacevim_enable_statusline_bfpath = 1
    " set shell=fish
    " volta not runnign well https://github.com/volta-cli/volta/issues/866
    if executable('volta')
      let g:node_host_prog = trim(system("volta which neovim-node-host"))
    endif
    " neogit configuration
    call SpaceVim#custom#SPC('nore', ['g', 'n'], 'Neogit', 'Neogit', 1)
    " Jest for javascript
    let g:test#javascript#runner = 'jest'
    let test#strategy = 'dispatch_background'
    " search config
    set smartcase
    set ignorecase
endfunction

function! myspacevim#after() abort
    lua << EOF
    local neogit = require('neogit')
    neogit.setup {
      disable_commit_confirmation = true,
      kind = 'split',
      sections = {
        untracked = {
          folded = true
        },
        unstaged = {
          folded = false
        },
        staged = {
          folded = false
        },
        stashes = {
          folded = true
        },
        unpulled = {
          folded = true
        },
        unmerged = {
          folded = false
          },
        recent = {
          folded = true
        },
      }
    }
EOF

    " typescript react prettier config
    let g:neoformat_typescriptreact_prettier = {
      \ 'exe': 'node_modules/.bin/prettier',
      \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript'],
      \ 'stdin': 1,
      \ 'try_node_exe': 1,
    \ }
    let g:neoformat_enabled_typescriptreact = ['prettier']
endfunction
