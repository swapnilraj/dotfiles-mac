set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'javascript' ] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Language server for ReasonML
Plug 'reasonml-editor/vim-reason-plus'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
call plug#end()
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set relativenumber
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set softtabstop=2
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set mouse=a "enable mouse because somtimes I want to just scroll
set colorcolumn=79
set textwidth=79
set swapfile
set dir=/tmp
set wildmenu
set clipboard=unnamed
"set shellcmdflag=-ic " source bash
set list
set listchars=tab:\|\ ,trail:•,eol:⌐,nbsp:+
set splitbelow
set splitright
set hidden " Required for renaming across files by LanguageClientNeovim
" Set timeout length for consecutive key presses in a map to 300
set ttimeout
set ttimeoutlen=0
set timeoutlen=300
syntax on

" Change mapleader
let mapleader = ","

nnoremap <leader>j 80\|bhxi<CR><Esc>J

" Go specific bindings
au FileType go set noexpandtab
au FileType go set shiftwidth=8
au FileType go set softtabstop=8
au FileType go set tabstop=2

" Enable spellcheck for markdown files
" Markdown files usually used for essays
au FileType markdown set spell
au FileType markdown set spelllang=en_us

" Set correct file for typescript files
au BufRead,BufNewFile *.ts   setfiletype typescript

" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" ----- Plugin-Specific Settings --------------------------------------
" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" ----- Gruvbox Color Scheme ---- 
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" ---- Airline -----
" Show PASTE if in paste mode
let g:airline_detect_paste=1

 " Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
 " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Handy mappings
nnoremap <tab> :w<bar>suspend<CR>
nnoremap <Leader>s :%s/\<C-r><C-w\>/
:command! W w

" ------ FZF -----------
" Change default utility used by fzf to seach files
" using ag for better code searching
"let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use Ctrl-P to trigger fzf
" Show only files that git is tracking
nnoremap <C-p> :GFiles<CR>
" Use Ctrl-P b to trigger fzf with open buffers
nnoremap <C-b> :Buffers<CR>

" netrw stuff
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
