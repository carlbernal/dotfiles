if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" Objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

" Visuals
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'

" Utilities
Plug 'vim-scripts/AutoComplPop'
Plug 'ludovicchabant/vim-gutentags'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-qf'
Plug 'dense-analysis/ale'
call plug#end()

" Platform Settings
set mouse=nvi
set ttymouse=sgr
set clipboard=unnamed
set backspace=2
set noesckeys
set timeoutlen=300
set ttimeoutlen=50

" File Management
set hidden
set autoread
set autowriteall
set backupdir^=$TMPDIR//
set directory^=$TMPDIR//

" Visuals
filetype plugin indent on
syntax on
set termguicolors
set noshowmode
set number relativenumber
set scrolloff=3
set colorcolumn=80
set cursorline
set signcolumn=no
set laststatus=2
set pumheight=6
set shortmess+=WcCI
set fillchars+=eob:\ 

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

" Indent
set smarttab
set expandtab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Completion
set complete-=i
set completeopt=menuone,noinsert
set omnifunc=syntaxcomplete#Complete

" Plugin Settings
colorscheme codedark
let g:codedark_conservative = 1
let g:netrw_banner = 0
let g:gutentags_cache_dir = expand('~/.ctags')

let g:ale_disable_lsp = 1
let g:ale_echo_cursor = 0
let g:ale_history_enabled = 0
let g:ale_hover_cursor = 0
let g:ale_popup_menu_enabled = 0
let g:ale_set_ballons = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 0
let g:ale_update_tagstack = 0
let g:ale_virtualtext_cursor = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0

let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   "javascript": ["prettier"],
    \   "html": ["prettier"],
    \   "css": ["prettier"],
    \   "json": ["prettier"],
    \   "python": ["black"],
    \}

let g:qf_max_height = 5
let g:qf_shorten_path = 3

" Color Groups
hi! MatchParen guifg=NONE
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE
hi QuickFixLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Auto Commands
au FileType qf setlocal cc= wrap linebreak
au CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
    \ escape(expand('<cword>'), '/\'))

" Commands
com! -range B echo join(
\ systemlist("git -C " . shellescape(expand('%:p:h')) . 
\ " blame -L <line1>,<line2> " . expand('%:t')), "\n"
\ )

" Mappings
let mapleader = " "
nnoremap q: <nop>
nnoremap Q <nop>
nnoremap == :ALEFix<cr>
nnoremap <leader><space> :nohl<cr>
