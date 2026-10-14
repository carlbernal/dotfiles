" ============================================================================
" Plugins
" ============================================================================

call plug#begin('~/.vim/plugged')
" Text Objects
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'

" Tools
Plug 'bfrg/vim-c-cpp-modern'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'romainl/vim-qf'
Plug 'jpalardy/vim-slime'
Plug 'eraserhd/parinfer-rust', {
      \ 'do': 'cargo build --release',
      \ 'for': ['lisp', 'scheme']
      \ }
call plug#end()

" ============================================================================
" Environment
" ============================================================================

let g:fd_cmd = executable('fd') ? 'fd' : executable('fdfind') ? 'fdfind' : ''

let g:file_list_cmd = empty(g:fd_cmd)
      \ ? "find . -type f -not -path '*/.git/*' -not -path '*/.hg/*'"
      \ : g:fd_cmd . ' --type f --exclude .git --exclude .hg'

" ============================================================================
" Options
" ============================================================================

set mouse=nvi
set ttymouse=sgr
set backspace=2
set timeoutlen=300
set ttimeoutlen=50

if has('clipboard')
  let &clipboard = has('macunix') ? 'unnamed' : 'unnamedplus'
else
  set clipboard=
endif

set hidden
set autoread
set noswapfile

set termguicolors
set background=dark

set noshowmode
set noshowcmd
set lazyredraw
set number
set scrolloff=4
set colorcolumn=80,100
set signcolumn=no
set pumheight=6
set laststatus=2
set synmaxcol=200
set shortmess+=WcCI
let &fillchars .= ',eob: '

set hlsearch
set incsearch
set ignorecase
set smartcase

if executable('rg')
  let &grepprg = 'rg --vimgrep --smart-case --hidden --glob=!.git --glob=!.hg'
  set grepformat=%f:%l:%c:%m
endif

set smarttab
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set breakindent

set wildmenu
set completeopt=menuone,noinsert
set omnifunc=syntaxcomplete#Complete
set complete-=it

" ============================================================================
" Plugin Settings
" ============================================================================

let g:netrw_banner = v:false
let g:codedark_conservative = v:true
let g:rainbow_active = v:false

" ALE
let g:ale_disable_lsp = v:true
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = v:false
let g:ale_lint_on_save = v:false
let g:ale_lint_on_enter = v:true

let g:ale_set_quickfix = v:false
let g:ale_set_loclist = v:true
let g:ale_open_list = v:true
let g:ale_loclist_msg_format = '[%linter%] %s (%code%)'

let g:ale_virtualtext_cursor = v:false
let g:ale_set_signs = v:false
let g:ale_set_highlights = v:false
let g:ale_echo_msg_format = ''

let g:ale_linters = {
      \ 'c': ['cppcheck'],
      \ 'cpp': ['cppcheck'],
      \ 'python': ['ruff'],
      \ 'sh': ['shellcheck'],
      \ }

let g:ale_fix_on_save = v:false
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'json': ['jq'],
      \ 'python': ['ruff_format'],
      \ 'sh': ['shfmt'],
      \ }

" Gutentags
let g:gutentags_enabled = v:true
let g:gutentags_cache_dir = expand('~/.tags')
let g:gutentags_generate_on_new = 0
let g:gutentags_exclude_project_root = [$HOME, '/usr/local', '/opt/homebrew']
let g:gutentags_exclude_filetypes = [
      \ 'text', 'gitcommit', 'log', 'qf', 'help'
      \ ]

let g:gutentags_ctags_extra_args =
      \ filereadable(expand('~/.ctags'))
      \ ? ['--options=' . expand('~/.ctags')] : []

if !empty(g:fd_cmd)
  let g:gutentags_file_list_command =
        \ g:fd_cmd . ' --type f --no-follow --exclude .git --exclude .hg'
endif

" Tagbar
let g:tagbar_position = 'botright horizontal'
let g:tagbar_autoclose = v:true
let g:tagbar_autofocus = v:true
let g:tagbar_sort = v:false
let g:tagbar_compact = v:true
let g:tagbar_indent = 2
let g:tagbar_wrap = 2
let g:tagbar_show_data_type = v:true
let g:tagbar_show_visibility = v:true
let g:tagbar_show_prefix = v:true
let g:tagbar_show_suffix = v:true
let g:tagbar_show_tag_count = v:true
let g:tagbar_ignore_anonymous = v:true

" Slime
let g:slime_target = 'vimterminal'
let g:slime_python_ipython = v:true
let g:slime_input_pid = v:false
let g:slime_suggest_default = v:true
let g:slime_menu_config = v:true

" Parinfer
let g:parinfer_mode = 'smart'

" ============================================================================
" Custom Functions
" ============================================================================

function! ApplyCustomHighlights() abort
  hi! MatchParen guifg=#569cd6 guibg=NONE ctermfg=75
        \ ctermbg=NONE gui=bold
  hi Search       guibg=#264f78 guifg=NONE ctermbg=24 ctermfg=NONE
  hi QuickFixLine guibg=#264f78 guifg=NONE ctermbg=24 ctermfg=NONE
endfunction

function! FzyCommand(choice_command, vim_command) abort
  try
    let l:output = system(a:choice_command . ' | fzy')
  catch /Vim:Interrupt/
    redraw!
    return
  endtry

  redraw!

  if v:shell_error == 0 && !empty(trim(l:output))
    execute a:vim_command . ' ' . fnameescape(trim(l:output))
  endif
endfunction

function! AutoSaveWinView() abort
  let w:SavedBufView = get(w:, 'SavedBufView', {})
  let w:SavedBufView[bufnr('%')] = winsaveview()
endfunction

function! AutoRestoreWinView() abort
  let l:buf = bufnr('%')
  let l:saved = get(w:, 'SavedBufView', {})

  if has_key(l:saved, l:buf)
    let l:view = winsaveview()

    if l:view.lnum == 1 && l:view.col == 0 && !&diff
      call winrestview(l:saved[l:buf])
    endif

    call remove(l:saved, l:buf)
  endif
endfunction

function! SendFileToSlime() abort
  let l:path = expand('%:p')
  let l:ft = &filetype
  let l:lisp = '(load "' . escape(l:path, '\"') . '")' . "\n"

  let l:cmds = {
        \ 'python': '%run -i ' . shellescape(l:path) . "\n",
        \ 'lisp': l:lisp,
        \ 'scheme': l:lisp,
        \ 'sql': "\\\i '" . substitute(l:path, "'", "''", 'g') . "'\n",
        \ 'sh': 'source ' . shellescape(l:path) . "\n",
        \ }

  if has_key(l:cmds, l:ft)
    call slime#send(l:cmds[l:ft])
  endif
endfunction

function! DeleteOtherBuffers() abort
  let l:current = bufnr('%')

  for l:buf in filter(
        \ range(1, bufnr('$')),
        \ 'bufexists(v:val) && buflisted(v:val)')
    if l:buf != l:current
      execute 'Bdelete ' . l:buf
    endif
  endfor
endfunction

" ============================================================================
" Autocommands
" ============================================================================

augroup CustomAutocmds
  autocmd!

  autocmd VimResized * tabdo wincmd =

  autocmd FileType qf setlocal cc= wrap linebreak
  autocmd FileType qf nnoremap <buffer><silent> <esc> :cclose <bar> lclose<cr>
  autocmd FileType qf exe 'resize ' . min([max([8, line('$')]), 8])

  autocmd FileType c,cpp setlocal errorformat+=%-G%.%#

  autocmd FileType tagbar nnoremap <buffer><silent> <esc> <c-w>c

  autocmd FileType lisp,scheme,python,json RainbowToggleOn

  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()

  autocmd ColorScheme * call ApplyCustomHighlights()
augroup END

" ============================================================================
" Custom Mappings
" ============================================================================

nnoremap Y y$
nnoremap zz zt
nnoremap zt zz
nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:echo ""<cr>

nnoremap <c-u> <nop>
nnoremap <c-x> :Bdelete<cr>
nnoremap <c-d> :call DeleteOtherBuffers()<cr>

cnoreabbrev <expr> ter
      \ getcmdtype() == ':' && getcmdline() ==# 'ter'
      \ ? 'leftabove vert ter' : 'ter'

if executable('fzy')
  nnoremap <c-p> :call FzyCommand(g:file_list_cmd, ':e')<cr>
endif

command! L ALELint
nnoremap == :ALEFix<cr>
nnoremap <c-o> :TagbarToggle<cr>

nnoremap <silent> <c-c><c-k> :call SendFileToSlime()<cr>
nnoremap <silent> <c-c><c-l> :call slime#send("\x0c")<cr>
nnoremap <silent> <c-c><c-u> :call slime#send("\x15")<cr>

colorscheme codedark
call ApplyCustomHighlights()
