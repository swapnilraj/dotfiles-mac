set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Language specific plugins
Plug 'reasonml-editor/vim-reason-plus'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'javascript' ] }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'mlr-msft/vim-loves-dafny', { 'for': 'dafny' }
" Utility Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'jreybert/vimagit'
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
" Set timeout length for consecutive key presses in a map to 500
set ttimeout
set ttimeoutlen=0
set timeoutlen=500
syntax on

" Change mapleader
let mapleader = ","

nnoremap <leader>j 80\|bhxi<CR><Esc>J

" Go specific bindings
au FileType go set noexpandtab shiftwidth=8 softtabstop=8 tabstop=2

" Enable spellcheck for markdown files
" Markdown files usually used for essays
au FileType markdown set spell
au FileType markdown set spelllang=en_us

" Set correct file for files
au BufRead,BufNewFile *.ts   set filetype typescript
au BufNewFile,BufRead *.purs set filetype=purescript

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

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Language server key bindings
nmap <leader>d <Plug>(coc-definition)
nmap <leader>y <Plug>(coc-type-definition)
nmap <leader>i <Plug>(coc-implementation)
nmap <leader>r <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>a :CocAction<CR>
vmap <leader>f  <Plug>(coc-format-selected)
" Use K for show documentation
nnoremap <leader>h :call <SID>show_documentation()<CR>
" Use :Format for format current buffer
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>f :Format<CR>

" Handy mappings
nnoremap <tab> :w<bar>suspend<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:command! W w

" ------ FZF -----------
" Ctrl-p to trigger fzf
" Show only files that git is tracking
nnoremap <C-p> :GFiles<CR>
" Ctrl-b to trigger fzf with open buffers
nnoremap <C-b> :Buffers<CR>

" netrw stuff
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
