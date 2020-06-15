call plug#begin('~/.local/share/nvim/plugged')

" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" language support
Plug 'sheerun/vim-polyglot'

call plug#end()

"" basics
let g:loaded_matchparen=1
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

""" Plugins settings

" python
let g:python_highlight_all = 1

" emmet
let g:user_emmet_leader_key=','

""" Custom shorutcuts
nnoremap <silent><C-S> :update<CR>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
