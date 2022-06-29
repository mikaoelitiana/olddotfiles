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
    " lazygit config
    call SpaceVim#custom#SPC('nore', ['g', 'l'], 'FloatermNew lazygit', 'LazyGit', 1)
    call SpaceVim#custom#SPC('nore', ['g', 'h', 'c'], 'FloatermNew gh pr create', 'gh pr create', 1)
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
    let g:neoformat_enabled_typescriptreact = ['prettier', 'prettier-eslint', 'eslint_d']
    " github
    let g:github_dashboard = { 'username': 'mikaoelitiana', 'password': $GITHUB_TOKEN }
    

    " equivalent of init.lua
    lua << EOF
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "typescript", "javascript" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        enable = true,
      },
    }

    require("neotest.logging"):set_level("INFO")
    require("neotest").setup({
     adapters = {
        -- require('neotest-jest')({
        --  jestCommand = "npx jest --"
        -- }),
        require("neotest-vim-test")({
          ignore_file_types = { "javascript", "typescript" }
        })
      }
    })

    local lsp = require('lsp-zero')
    lsp.preset('recommended')
    lsp.setup()

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
EOF
endfunction

function! SpaceVim#layers#core#statusline#get(...) abort
endfunction

function! SpaceVim#layers#test#config() abort
  let g:_spacevim_mappings_space.k = get(g:_spacevim_mappings_space, 'k',  {'name' : '+Test'})
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'n'], 'lua require("neotest").run.run()', 'nearest', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'f'], 'lua require("neotest").run.run(vim.fn.expand("%"))', 'file', 1)
  call SpaceVim#mapping#space#def('nnoremap', ['k', 'l'], 'lua require("neotest").run.run_last()', 'last', 1)
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
