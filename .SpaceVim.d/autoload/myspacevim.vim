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
    let g:test#custom_strategies = {'spacevim': function('SpaceVim#plugins#runner#open')}
    let g:test#strategy = 'spacevim'
    let g:test#enabled_runners = ["javascript#mocha"]
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
    let g:neoformat_enabled_javascript = ['prettier_d',  'eslint_d']
    let g:neoformat_enabled_typescript = ['prettier_d',  'eslint_d']
    let g:neoformat_enabled_typescriptreact = ['prettier_d',  'eslint_d']
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
    -- neotest
    --require("neotest").setup({
    -- adapters = {
    --   -- require('neotest-jest')({}),
    --   require("neotest-vim-test")({
    --     --  ignore_file_types = { "javascript", "typescript" }
    --    })
    --  }
    --})
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "typescript", "tsx", "javascript" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        enable = true,
      },
    }

    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    lsp.setup()

    local signature_config = {
      hint_enable = false,
      handler_opts = { border = "single" },
      max_width = 80,
    }
    require "lsp_signature".setup(signature_config)

    -- Automatically enter insert mode when entering neovim terminal buffer
    -- For neotest floating window, stopinsert
    vim.api.nvim_create_autocmd("TermOpen", {
      desc = "Auto enter insert mode when opening a terminal",
      pattern = "*",
      callback = function()
        -- Wait briefly just in case we immediately switch out of the buffer
        vim.defer_fn(function()
          if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
            vim.cmd([[startinsert]])
          else
            vim.cmd([[stopinsert]])
          end
        end, 100)
      end,
    })

    -- require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/snippets/"})
EOF
endfunction

function! SpaceVim#layers#core#statusline#get(...) abort
  return 0
endfunction

function! SpaceVim#layers#test#config() abort
  let g:_spacevim_mappings_space.k = get(g:_spacevim_mappings_space, 'k',  {'name' : '+Test'})
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'n'], 'lua require("neotest").run.run()', 'nearest', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'f'], 'lua require("neotest").run.run(vim.fn.expand("%"))', 'file', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'l'], 'lua require("neotest").run.run_last()', 'last', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 's'], 'lua require("neotest").run.run({ suite = true })', 'suite', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'u'], 'lua require("neotest").summary.toggle()', 'jump-to-summary', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'U'], 'lua require("neotest").summary.toggle()', 'open-summary', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'k'], 'lua require("neotest").run.stop()', 'stop-nearest', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'K'], 'lua require("neotest").run.stop()', 'stop', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'a'], 'lua require("neotest").run.attach()', 'attach', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'd'], 'lua require("neotest").run.run({strategy = "dap"})', 'debug-nearest', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'D'], 'lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})', 'debug', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'j'], 'lua require("neotest").jump.next({ status = "failed" })', 'jump-to-next-failed', 0)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'k'], 'lua require("neotest").jump.prev({ status = "failed" })', 'jump-to-prev-failed', 0)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'o'], 'lua require("neotest").output.open({ enter = true })', 'show-output', 1)
  let g:test#custom_strategies = {'spacevim': function('SpaceVim#plugins#runner#open')}
  let g:test#strategy = 'spacevim'
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

