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

"" Visuals
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'

"" Utilities
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'ludovicchabant/vim-gutentags'
Plug 'markonm/traces.vim'
Plug 'preservim/tagbar'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-fugitive'
call plug#end()

"" Platform Settings
set mouse=nvi
set ttymouse=sgr
set clipboard=unnamed
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
set number relativenumber
set scrolloff=4
set colorcolumn=80
set cursorline
set signcolumn=no
set laststatus=2
set pumheight=6
set shortmess+=WcCI
set fillchars+=eob:\ ,vert:\ 

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmenu
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

"" Indent
set smarttab
set expandtab
set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4

"" Completion
" Only get matches from current file
set complete=.
" set complete-=i
set completeopt=menuone,noinsert
set omnifunc=syntaxcomplete#Complete

"" Plugin Settings
colorscheme codedark
let g:codedark_conservative=1
let g:netrw_banner = 0
let g:gutentags_cache_dir = expand('~/.ctags')

let g:fzf_action = {'ctrl-x': 'split', 'ctrl-v': 'vsplit'}
let g:fzf_layout = {"down": "30%"}
let g:fzf_colors = {'gutter': ['bg', 'Normal']}

let g:qf_max_height = 5
" let g:qf_shorten_path = 3

" Customize tagbar behaviour
let g:tagbar_position = 'topleft'
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_show_balloon = 0
let g:tagbar_indent = 2
let g:tagbar_show_linenumbers = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autoshowtag = 1
let g:tagbar_silent = 1
let g:tagbar_wrap = 1
let g:tagbar_ignore_anonymous = 1

" Show all metadata about tags
let g:tagbar_show_data_type = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_prefix = 1
let g:tagbar_show_suffix = 1
let g:tagbar_show_tag_linenumbers = 2
let g:tagbar_show_tag_count = 1

" Remove tagbar mappings for folding
let g:tagbar_map_openfold = ""
let g:tagbar_map_closefold = ""

let g:ale_echo_msg_format = '%linter%: %s'

" Remove LSP completion and LSP tags integration
let g:ale_completion_enabled = 0
let g:ale_update_tagstack = 0

" Don't run lint when buffer is changed
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0

" Disable messages besides location list
let g:ale_history_enabled = 0
let g:ale_hover_cursor = 0
let g:ale_echo_cursor = 0
let g:ale_popup_menu_enabled = 0
let g:ale_set_ballons = 0
let g:ale_set_highlights = 0
let g:ale_set_signs = 0
let g:ale_virtualtext_cursor = 0

" Automatically open the location list if there is something to display
let g:ale_open_list = 1
let g:ale_list_window_size = 5

" ALE settings for file name pattern matched
let g:ale_pattern_options = {
    \   "\.css$" : {"ale_enabled": 0},
    \   "\.html$" : {"ale_enabled": 0},
    \   "\.jsdoc$" : {"ale_enabled": 0},
    \}

let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   "sql": ["sqlfluff"],
    \   "javascript": ["prettier"],
    \   "typescript": ["prettier"],
    \   "html": ["prettier"],
    \   "css": ["prettier"],
    \   "json": ["jq"],
    \   "python": ["black"],
    \   "go": ["gofmt"],
    \   "lua": ["stylua"],
    \   "cpp": ["clang-format"],
    \   "c": ["clang-format"]
    \}

"" Color Groups
hi! MatchParen guifg=NONE
hi Search guibg=#343945 guifg=NONE
hi HiUnderCursor guibg=#3b424f guifg=NONE
hi QuickFixLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

"" Auto Commands
au FileType qf setlocal cc= wrap linebreak
" Highlight all occurance of the word under cursor
au CursorMoved * exe printf('match HiUnderCursor /\V\<%s\>/',
    \ escape(expand('<cword>'), '/\'))
au BufRead,BufNewFile *.jsdoc set filetype=javascript
au FileType javascript setlocal ts=8 sts=2 sw=2
au FileType html setlocal ts=8 sts=2 sw=2
au FileType css setlocal ts=8 sts=2 sw=2

"" Mappings
let mapleader = " "
nnoremap Y y$
nnoremap q: <nop>
nnoremap Q <nop>
nnoremap <leader><space> :nohl<cr>
nnoremap == :ALEFix<cr>
nnoremap -- :TagbarToggle<cr>
nnoremap <c-p> :FZF<cr>

"" Commands
command T cgetexpr system("todo")

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
