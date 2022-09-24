set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Language specific plugins
Plug 'reasonml-editor/vim-reason-plus'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'javascript' ] }
Plug 'peitalin/vim-jsx-typescript'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'mlr-msft/vim-loves-dafny', { 'for': 'dafny' }
Plug 'tomlion/vim-solidity', { 'for': 'solidity' }
" Utility Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'jreybert/vimagit'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/hiPairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-dispatch'
Plug 'kana/vim-textobj-user'
Plug 'fvictorio/vim-textobj-backticks'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
set colorcolumn=100
set textwidth=100
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
au FileType markdown set spelllang=en_gb

" Set correct file for files
au BufNewFile,BufRead *.ts   set filetype=typescript
au BufNewFile,BufRead *.purs set filetype=purescript
au BufNewFile,BufReadPost *.cairo set filetype=cairo
au Filetype cairo set syntax=cairo setlocal commentstring=#\ %s

" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" ----- Plugin-Specific Settings --------------------------------------
" ----- jreybert/vimagit -----
nnoremap <leader>g :Magit<CR>

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

" Coc extensions
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-css',
    \'coc-json',
    \'coc-tsserver',
    \'coc-cairo',
    \'coc-solidity',
    \]

" Handy mappings
"nnoremap <tab> :w<bar>suspend<CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:command! W w

" ------ FZF -----------
" Ctrl-p to trigger fzf
" Show only files that git is tracking
"" list files/git files
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! Ctrlp execute 'Files' s:find_git_root()
nnoremap <C-p> :Ctrlp<CR>
" Ctrl-b to trigger fzf with open buffers
nnoremap <C-b> :Buffers<CR>
" Make them windows float
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }

" --- Async Run -----
" Open quickfix window of height 6
let g:asyncrun_open = 6

" ---- LaTex -----
nnoremap <leader>c :AsyncRun make && open -a Preview && open -a iTerm<CR>

" netrw stuff
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_liststyle = 3

" ---- EditorConfig ----
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" ----- Open quickfix list after grep -----
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
