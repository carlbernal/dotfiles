call plug#begin('~/.vim/plugged')

" verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

" visuals
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'

" tools
Plug 'vim-scripts/AutoComplPop'
Plug 'ludovicchabant/vim-gutentags'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-qf'

call plug#end()

" platform settings
set mouse=nvi
set ttymouse=sgr
set clipboard=unnamed
set backspace=2
set noesckeys
set timeoutlen=300
set ttimeoutlen=50

" file management
set hidden
set autoread
set autowriteall
set backupdir^=$TMPDIR//
set directory^=$TMPDIR//

" visuals
filetype plugin indent on
syntax on
set termguicolors
set noshowmode
set number relativenumber
set scrolloff=4
set colorcolumn=80
set cursorline
set laststatus=2
set signcolumn=no
set shortmess+=WcC
set fillchars+=eob:\ 
colorscheme codedark
let g:codedark_conservative=1
let g:netrw_banner = 0

" search
set hlsearch
set ignorecase
set smartcase
set wildmenu

" spacing
set smarttab
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" completion
set complete-=i
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert
set pumheight=6

" mappings
let mapleader = " "
nnoremap <leader><space> :nohl<cr>

" helper color groups
hi! MatchParen guifg=NONE
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE

" highlight all occurance of the word under the cursor
autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
            \ escape(expand('<cword>'), '/\'))

" vim-qf
let g:qf_shorten_path = 3 

" gutentags
let g:gutentags_cache_dir = expand('~/.ctags')
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = [
            \ 'package.json',
            \ 'requirements.txt',
            \ 'go.mod',
            \ 'CMakeLists.txt',
            \ ]
