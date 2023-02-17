let s:WIN = SpaceVim#api#import('vim#window')

function! myspacevim#before() abort
    let g:spacevim_project_auto_root = 0
    let g:spacevim_project_rooter_outermost = 0
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
    " set shell=fish
    " lazygit config
    call SpaceVim#custom#SPC('nore', ['g', 's'], 'FloatermNew lazygit', 'LazyGit', 1)
    call SpaceVim#custom#SPC('nore', ['g', 'h', 'c'], 'FloatermNew gh pr create', 'gh pr create', 1)
    let g:test#enabled_runners = ["javascript#mocha"]
    let g:ultest_deprecation_notice = 0
    " search config
    set smartcase
    set ignorecase
    " code action mapping Shift+Option+Enter
    nnoremap <silent> <M-CR> :lua vim.lsp.buf.code_action()<CR>
    " open diagnostic floating window
    nnoremap <silent> <M-D> :lua vim.diagnostic.open_float()<CR>
    " yank to clipboard
    set clipboard+=unnamedplus
    " floatterm plugin config
    let g:floaterm_width = 0.9
    let g:floaterm_height = 0.9
    let g:floaterm_autoclose = 1
    " set wrap to soft
    set wrap 
    set linebreak
    " nvim-cmp 
    inoremap <C-x><C-o> <Cmd>lua require('cmp').complete()<CR>
    set winbar=%f
endfunction

function! myspacevim#after() abort
    let g:neoformat_run_all_formatters = 1
    " typescript react prettier config
    let g:neoformat_typescriptreact_prettier = {
      \ 'exe': 'node_modules/.bin/prettier',
      \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript'],
      \ 'stdin': 1,
      \ 'try_node_exe': 1,
    \ }
    let g:neoformat_enabled_javascript = ['prettier-eslint', 'prettierd',  'eslint_d', 'prettier']
    let g:neoformat_enabled_typescript = ['prettier-eslint', 'prettierd',  'eslint_d', 'prettier']
    let g:neoformat_enabled_typescriptreact = ['prettier-eslint', 'prettierd',  'eslint_d', 'prettier']
    " github
    let g:github_dashboard = { 'username': 'mikaoelitiana', 'password': $GITHUB_TOKEN }

    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
    for i in range(1, 9)
      exe "call SpaceVim#mapping#space#def('nnoremap', ["
            \ . i . "], 'call JumpToWindow("
            \ . i . ")', 'window-" . i . "', 1)"
    endfor

    call SpaceVim#mapping#space#regesit_lang_mappings('typescript', function('s:set_lsp_mappings'))
    call SpaceVim#mapping#space#regesit_lang_mappings('typescriptreact', function('s:set_lsp_mappings'))

    " --------------------------------------------------------------------------------------- "
    " equivalent of init.lua
    lua << EOF
    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    lsp.setup()

    local signature_config = {
      hint_enable = false,
      handler_opts = { border = "single" },
      max_width = 80,
    }
    require "lsp_signature".setup(signature_config)
    
    local cmp = require('cmp')
    cmp.setup {
      mapping = {
        ['<Tab>'] = cmp.mapping((function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            vim.fn['codeium#Accept']()
            fallback()
          end
        end), {'i', 's'})
      }
    }
EOF
endfunction

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction
function! JumpToWindow(i) abort
  if s:WIN.win_count() >= a:i
    exe a:i . 'wincmd w'
  endif
endfunction

function! s:set_lsp_mappings() abort
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'd'], 'lua vim.diagnostic.open_float()', 'show-document', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'e'], 'lua vim.lsp.buf.rename()', 'rename-symbol', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'f'], 'lua vim.lsp.buf.code_action()', 'code fix', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'p'], 'lua vim.lsp.buf.signature_help()', 'signature help', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 't'], 'lua vim.lsp.buf.type_definition()', 'view type', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'R'], 'lua vim.lsp.buf.references()', 'show reference', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'D'], 'lua vim.diagnostic.open_float()', 'show errors', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'o'], 'lua vim.lsp.buf.formatting()', 'format', 1)
endfunction

function! s:on_typescript_ft() abort
endfunction

