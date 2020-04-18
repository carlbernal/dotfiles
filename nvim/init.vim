call plug#begin('~/.local/share/nvim/plugged')

Plug 'psliwka/vim-smoothie'
Plug 'mattn/emmet-vim'

" visual plugins
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" searching
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

"" looks
filetype plugin indent on
syntax on
colorscheme molokai
let g:molokai_original=1
set termguicolors
set laststatus=2
set cursorline
set colorcolumn=80

" visualize whitespace
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

"" basics
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

"" plugin settings

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" fzf
let g:fzf_nvim_statusline = 0
nnoremap <silent><C-p> :FZF<CR>

" smoothie
let g:smoothie_no_default_mappings = 1
silent! nmap <unique> <S-j> <Plug>(SmoothieDownwards)
silent! nmap <unique> <S-k> <Plug>(SmoothieUpwards)

" emmet
let g:user_emmet_leader_key=','
