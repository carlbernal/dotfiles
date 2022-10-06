call plug#begin('~/.vim/plugged')

" verbs plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" objects plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

" visual plugins
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'

" general plugins
Plug 'tpope/vim-vinegar'
Plug 'junegunn/goyo.vim'

call plug#end()

" general settings
set number relativenumber
set hidden
set mouse=a
set clipboard=unnamedplus
set noswapfile
let mapleader = "<nop>"

" visual settings
colorscheme sonokai
filetype plugin indent on
syntax on
set termguicolors
set noshowmode
set colorcolumn=80
set cursorline
set laststatus=2

" search settings
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set grepprg=ag\ --vimgrep\ $*

" spacing settings
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" omni completion
set shortmess+=c

" highlight all occurance of the word under the cursor
autocmd CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
			\ escape(expand('<cword>'), '/\'))

" plugin settings
autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse = 0

let g:python_highlight_all = 1
let g:python3_host_prog = "/usr/bin/python3"

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" shortcuts
nnoremap <silent>\ :bd<cr>
nnoremap <silent>` :Goyo<cr>
nnoremap <silent><space><space> :noh<cr>
nnoremap <silent><c-s> :update<cr>

" color helper groups
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE
hi! MatchParen guifg=NONE
