call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'

Plug 'tomasr/molokai'

Plug 'mattn/emmet-vim'

" js
Plug 'dense-analysis/ale'
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'} 
Plug 'pangloss/vim-javascript'

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
set mouse=a 
let g:loaded_matchparen=1
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

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

" fzf
let g:fzf_nvim_statusline=0
nnoremap <silent> <C-p> :FZF<CR>

" emmet
let g:user_emmet_leader_key=','


" deoplete 
let g:deoplete#enable_at_startup = 1
" use tab for completion cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


" js ternjs settings
let g:deoplete#sources#ternjs#tern_bin = '/home/carlbernal/.nvm/versions/node/v13.3.0/lib/node_modules'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#include_keywords=1

" ale settings
let b:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" alt + j/k - add newline above or below
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
