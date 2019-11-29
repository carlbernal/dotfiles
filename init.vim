call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'

Plug 'tomasr/molokai'

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

" plugin specifics
let g:deoplete#enable_at_startup = 1

" emmet
let g:user_emmet_install_global = 0
au FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" go deoplete
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
