" ENTER/TAB are confirming keys.
inoremap <silent><expr> <CR>
         \ pumvisible() ? coc#_select_confirm() :
         \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <Tab>
         \ pumvisible() ? coc#_select_confirm() :
         \ "\<Tab>"

" Show document in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc-actions
let mapleader = ","
nmap <silent>ga <Plug>(coc-codeaction)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gt <Plug>(coc-type-definition)
nmap <silent>g_ <Plug>(coc-diagnostic-prev)
nmap <silent>g] <Plug>(coc-diagnostic-next)
nmap <leader>na <Plug>(coc-rename)

" CocList
nnoremap <space>l :CocList<cr>
nnoremap <space>c :CocList commands<cr>
nnoremap <space>d :CocList diagnostics<cr>
nnoremap <space>o :CocList outline<cr>
nnoremap <space>s :CocList snippets<cr>

" CocUpdate
nnoremap <silent><space>u :CocUpdate<cr>

" coc-snippets
imap <C-k> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-a>'
let g:coc_snippet_prev = '<C-z>'

" Extensions
let g:coc_global_extensions = [
  \ '@yaegassy/coc-tailwindcss3',
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-eslint',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-pyright',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-stylelint',
  \ 'coc-svelte',
  \ 'coc-toml',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-yaml',
  \ ]
