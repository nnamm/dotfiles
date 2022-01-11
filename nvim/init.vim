" dein --------------------------------------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein/dein.toml',        {'lazy': 0})
  if has('mac')
    call dein#load_toml('~/.config/nvim/dein/dein_mac.toml',  {'lazy': 0})
  elseif has('unix')
    call dein#load_toml('~/.config/nvim/dein/dein_unix.toml', {'lazy': 0})
  endif
  call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml',   {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

" token for dein_check_update
if filereadable(expand('~/dotfiles/nvim/token'))
  source ~/dotfiles/nvim/token
endif

" General -----------------------------------------------------
filetype plugin on
filetype indent on
syntax enable

set encoding=utf-8
set number                      " Display line number
set scrolloff=8                 " Control screen lines
set splitbelow                  " Display to the bottom when split horizontally
set splitright                  " Display to the right when split vertically
set hlsearch                    " Highlight search text
set incsearch                   " Incremental search
set ignorecase                  " Do not distinguish between upper & lower case when searching
set smartcase                   " If it contains capital letters, distinguish them
set wildmenu                    " Command completion
set wildmode=longest:full       " Enable file name completion
set nowrap                      " Stop line wrapping
set cindent                     " Indent mode
set termguicolors               " True Color
set tabstop=4                   " Spaces count as a single tab
set shiftwidth=4                " Number of spaces when tabbed
set softtabstop=4               " Number of spaces when indented
set expandtab                   " Convert tab to space
set clipboard=unnamed           " Copy to clipboard
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let mapleader = ","
nmap <leader>e <Plug>(easymotion-s2)

nnoremap ss :split<CR><C-w>j
nnoremap sv :vsplit<CR><C-w>l
nnoremap <silent><ESC><ESC> :nohlsearch<CR>

inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-d> <DEL>
nmap 9 $

" do not enter the default register by deleting the x key
nnoremap x "_x
vnoremap x "_x

" Tab key action
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Plugin fzf.vim
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

" Plugin preview-markdown.vim
nmap <leader>pm :PreviewMarkdown<CR>

" Plugin vim-airline action
nmap <C-]> <Plug>AirlineSelectNextTab

" Plugin Vimspector
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

" autocmd - tab/space
" autocmd FileType javascript,json,svelte,css,scss,html,vim,vue setlocal tabstop=2 shiftwidth=0 expandtab
autocmd FileType css             setlocal ts=2 sw=0 et
autocmd FileType html            setlocal ts=2 sw=0 et
autocmd FileType javascript      setlocal ts=2 sw=0 et
autocmd FileType javascriptreact setlocal ts=2 sw=0 et
autocmd FileType json            setlocal ts=2 sw=0 et
autocmd FileType scss            setlocal ts=2 sw=0 et
autocmd FileType svelte          setlocal ts=2 sw=0 et
autocmd FileType typescript      setlocal ts=2 sw=0 et
autocmd FileType typescriptreact setlocal ts=2 sw=0 et
autocmd FileType vim             setlocal ts=2 sw=0 et
autocmd FileType vue             setlocal ts=2 sw=0 et
" autocmd
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml']
autocmd BufWrite *.py :silent call CocAction('runCommand', 'python.sortImports')
autocmd BufWrite *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
