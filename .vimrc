" iceblue vimrc

" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' " git commands in vim

" other
Plugin 'airblade/vim-gitgutter' " git diff in vim
Plugin 'vim-airline/vim-airline' 
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

" looks
syntax on
colorscheme molokai
let g:molokai_orignal=1

" basics
set encoding=utf8
set ttyfast
set nowrap
set laststatus=2
set number
set cursorline
set colorcolumn=80

let g:loaded_matchparen=1

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
