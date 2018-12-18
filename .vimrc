set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
" ----- Making Vim look good ------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'
" v2 of the nvim-completion-manager.
Plug 'ncm2/ncm2'
" Language server for ReasonML
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
set splitbelow
set splitright
set hidden " Required for renaming across files by LanguageClientNeovim
syntax on

" Go specific bindings
au FileType go set noexpandtab
au FileType go set shiftwidth=2
au FileType go set softtabstop=8
au FileType go set tabstop=8

" Enable spellcheck for markdown files
" Markdown files usually used for essays
au FileType markdown set spell
au FileType markdown set spelllang=en_us

" Set correct file for typescript files
au BufRead,BufNewFile *.ts   setfiletype typescript

au BufEnter  *  call ncm2#enable_for_buffer()
" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

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

" ------ Language Client Neovim ------

let g:LanguageClient_autostart = 1
let g:LanguageClient_serverCommands = {
      \ 'haskell': ['hie-wrapper'],
      \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'reason':
      \ ['/Users/thawne/dev/reason-language-server/reason-language-server.exe'],
      \}

" ------ Language Server key bindings ---------
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <leader> H :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader> D :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> R :call LanguageClient#textDocument_rename()<CR>


" netrw stuff
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
