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
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'

call plug#end()

" general
set number relativenumber
set hidden
set mouse=nvi
set clipboard=unnamed
set ttymouse=sgr
set noswapfile
set autoread
set noesckeys
set timeoutlen=300
set ttimeoutlen=50

" visuals
filetype plugin indent on
syntax on
set termguicolors
set noshowmode
set scrolloff=5
set colorcolumn=80
set cursorline
set laststatus=2
colorscheme codedark
let g:codedark_conservative=1

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set grepprg=rg\ --vimgrep\ $*

" spacing
set smarttab
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" omni complete
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert
set pumheight=6
set shortmess+=c

" helper color groups
hi! MatchParen guifg=NONE
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE

" highlight all occurance of the word under the cursor
autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
            \ escape(expand('<cword>'), '/\'))

" shortcuts
nnoremap <leader><space> :nohl<cr>
