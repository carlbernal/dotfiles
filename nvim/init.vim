"" plugins
call plug#begin('~/.local/share/nvim/plugged')

" dependency
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kana/vim-textobj-user'

" visual plugins
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" custom functions
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'terryma/vim-smooth-scroll'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale' " linting engine
Plug 'tpope/vim-fugitive' " git plugin

" js
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'pangloss/vim-javascript'

call plug#end()

"" looks
filetype plugin indent on
syntax on
colorscheme molokai
let g:molokai_original = 1
set termguicolors
set laststatus=2
set cursorline
set colorcolumn=80

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

"" basics
let mapleader = "\<space>"
let g:loaded_matchparen=1 " ignore paired paren highlight
set nowrap
set number relativenumber

set hidden
set mouse=a 
set clipboard+=unnamedplus

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" default tabs and indent
set smarttab
set autoindent
set smartindent

set shiftwidth=4
set tabstop=4

"" plugin specifics

" vim airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" fzf
let g:fzf_nvim_statusline=0
nnoremap <silent><C-p> :FZF<CR>

" ctrl + j/k as smooth scroll
noremap <silent><S-j> :call smooth_scroll#down(&scroll/2, 12, 1)<CR>
noremap <silent><S-k> :call smooth_scroll#up(&scroll/2, 12, 1)<CR>

" emmet
let g:user_emmet_leader_key=','

" ale settings
let b:ale_fixers = ['eslint']

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" deoplete 
let g:deoplete#enable_at_startup = 1

" use tab for completion cycle for deoplete
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" js ternjs settings
let g:deoplete#sources#ternjs#tern_bin = '/home/carlbernal/.nvm/versions/node/v13.3.0/lib/node_modules'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#include_keywords=1
