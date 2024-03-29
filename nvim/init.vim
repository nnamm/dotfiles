" dein ---------------------------------------------------------------
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

" General ------------------------------------------------------------
filetype plugin on
filetype indent on
syntax enable

set encoding=utf-8
set number                         " Display line number
set scrolloff=10                   " Control screen lines
set splitbelow                     " Display to the bottom when split horizontally
set splitright                     " Display to the right when split vertically
set hlsearch                       " Highlight search text
set incsearch                      " Incremental search
set ignorecase                     " Do not distinguish between upper & lower case when searching
set smartcase                      " If it contains capital letters, distinguish them
"set nowrapscan                     " Do not cycle the searching
set cursorline                     " Highlight a current line
set wildmenu                       " Command completion
set wildmode=longest:full          " Enable file name completion
set nowrap                         " Stop line wrapping
set cindent                        " Indent mode
set termguicolors                  " True Color
set tabstop=4                      " Spaces count as a single tab
set shiftwidth=4                   " Number of spaces when tabbed
set softtabstop=4                  " Number of spaces when indented
set expandtab                      " Convert tab to space
set clipboard=unnamed              " Copy to clipboard
set completeopt=menuone,noinsert   " Control completion window
set synmaxcol=1500                 " Max column 3000(default) -> 1500
" the following 6settings are recommended by coc.nvim
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number

let mapleader = ","
nnoremap <silent>ss :split<CR><C-w>j
nnoremap <silent>sv :vsplit<CR><C-w>l
nnoremap <silent><ESC><ESC> :nohlsearch<CR>
vnoremap v ^$h

" cursor
inoremap <C-f> <RIGHT>
inoremap <C-b> <LEFT>
" inoremap <C-p> <UP>
" inoremap <C-n> <DOWN>
inoremap <C-d> <DEL>
" once 'nowrap' is disabled, enable the following settings
" nmap gj gj<SID>g
" nmap gk gk<SID>g
" nnoremap <script> <SID>gj gj<SID>g
" nnoremap <script> <SID>gk gk<SID>g
" nmap <SID>g <Nop>

" Tab key action
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" do not enter the default register by deleting key
nnoremap x "_x
vnoremap x "_x

" Plugin command -----------------------------------------------------
" coc.nvim -> coc.rc.vim
" defx.nvim -> defx.rc.vim
" dein.vim
nnoremap <leader>du :call dein#check_update(v:true)<CR>

" fzf.vim
nnoremap <silent><leader>f :Files<CR>
nnoremap <silent><leader>g :GFiles<CR>
nnoremap <silent><leader>G :GFiles?<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>h :History<CR>
nnoremap <silent><leader>r :Rg<CR>

" preview-markdown.vim
nmap <silent><leader>pm :PreviewMarkdown<CR>

" test.vim
nmap <silent><leader>t :TestNearest<CR>
nmap <silent><leader>T :TestFile<CR>
nmap <silent><leader>a :TestSuite<CR>
tmap <C-o> <C-\><C-n>

" vim-airline
nmap <C-_> <Plug>AirlineSelectPrevTab
nmap <C-]> <Plug>AirlineSelectNextTab

" jumpcursor.vim
nmap <leader>j <Plug>(jumpcursor-jump)

" vim-quickhl
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)
nmap <leader>+ <Plug>(quickhl-cword-toggle)
xmap <leader>+ <Plug>(quickhl-cword-toggle)

" Vimspector
" F-keys functions: https://github.com/puremourning/vimspector#human-mode
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame

" autocmd ------------------------------------------------------------
autocmd FileType c               setlocal ts=2 sw=0 et
autocmd FileType cpp             setlocal ts=2 sw=0 et
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
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml']
autocmd BufWrite *.py :silent call CocAction('runCommand', 'python.sortImports')
autocmd BufWrite *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Restore cursor setting ---------------------------------------------
augroup RestoreCursorShapeOnExit
  autocmd!
  autocmd VimLeave * set guicursor=a:hor20
augroup END
