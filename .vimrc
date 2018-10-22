set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
Plug 'pangloss/vim-javascript'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set mouse=c
set colorcolumn=80
set swapfile
set wildmenu
set clipboard=unnamed
set dir=/tmp
"set shellcmdflag=-ic " source bash
set list
set listchars=tab:\|\ ,trail:•,eol:⌐,nbsp:+
syntax on

" ----- Plugin-Specific Settings --------------------------------------

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" ----- Dracula Color Scheme ---- 
let g:dracula_colorterm=0
color dracula

" ---- Airline -----
" Show PASTE if in paste mode
let g:airline_detect_paste=1

 " Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
 " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ---- Ctrl - P -----

 " Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'r'

let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
