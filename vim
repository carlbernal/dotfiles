" iceblue vimrc

" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' " git wrapper

" other
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'

" language specific
Plugin 'sheerun/vim-polyglot'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" looks
syntax on
colorscheme molokai
let g:molokai_original=1

" basics
set ttyfast
set nowrap
set laststatus=2
set number
set cursorline
set colorcolumn=80

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" tabs and indent
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

" auto close
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" automatically remove trailing whitespace after :w
au BufWritePre *.txt,*.js,*.py,.*sh %s/\s\+$//e

" emmet
let g:user_emmet_install_global = 0
au FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" disable arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
