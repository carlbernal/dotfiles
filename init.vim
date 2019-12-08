call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'

Plug 'tomasr/molokai'

Plug 'fatih/vim-go'
Plug 'deoplete-plugins/deoplete-go', {'do': 'make'}

Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}

Plug '~/.fzf'

call plug#end()

" looks
filetype plugin indent on
syntax on
set termguicolors
colorscheme molokai
let g:molokai_original = 1

" basics
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
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" plugin specifics

" deoplete 
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" go settings
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" js ternjs settings
let g:deoplete#sources#ternjs#tern_bin = '/home/carlbernal/.nvm/versions/node/v13.3.0/lib/node_modules'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#include_keywords=1

