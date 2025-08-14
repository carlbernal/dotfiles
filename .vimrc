if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"" Verbs
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'

"" Objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

"" Utilities
Plug 'bfrg/vim-fzy'
Plug 'markonm/traces.vim'
Plug 'romainl/vim-qf'

"" Colorscheme
Plug 'tomasiser/vim-code-dark'
call plug#end()

let mapleader = ","
let maplocalleader = ","

"" Platform Settings
set mouse=nvi
set ttymouse=sgr
set clipboard=unnamedplus
set backspace=2
set noesckeys
set timeoutlen=300
set ttimeoutlen=50

"" File Management
set hidden
set autoread
set autowriteall
set backupdir^=$TMPDIR//
set directory^=$TMPDIR//

"" Visuals
filetype plugin indent on
syntax on
set background=dark
set termguicolors
set noshowmode
set number
set scrolloff=4
set colorcolumn=80,100
set signcolumn=no
set laststatus=2
set pumheight=6
set shortmess+=WcCI
set fillchars+=eob:\

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

"" Indent
set smarttab
set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set breakindent

"" Completion
set wildmenu
set completeopt=menuone,noinsert
set omnifunc=syntaxcomplete#Complete

"" Plugin Settings
let g:codedark_conservative=1
colorscheme codedark
let g:netrw_banner = 0

"" Color Groups
hi! MatchParen guifg=NONE
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE
hi QuickFixLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

"" Auto Commands
au FileType qf setlocal cc= wrap linebreak
au FileType javascript setlocal ts=2 sts=2 sw=2
au FileType html setlocal ts=2 sts=2 sw=2
au FileType css setlocal ts=2 sts=2 sw=2
au FileType markdown setlocal ts=2 sts=2 sw=2

"" Mappings
nnoremap Y y$
nnoremap zz zt
nnoremap zt zz
nnoremap <c-x> :<c-u>bp<bar>sp<bar>bn<bar>bd!<cr>
nnoremap <c-d> :<c-u>%bd<bar>e#<cr>
nnoremap <c-l> :<c-u>nohlsearch<bar>diffupdate<bar>echo ""<cr>
nnoremap <c-p> :<c-u>FzyFind<cr>

"" Avoid scrolling when switching buffers
" https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers

"Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
