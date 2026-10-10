"" ============================================================================
"" Plugin Manager
"" ============================================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'moll/vim-bbye'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale', { 'on': ['ALEFix', 'ALELint', 'ALEToggle'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'romainl/vim-qf'
Plug 'jpalardy/vim-slime'
Plug 'ojroques/vim-oscyank'
Plug 'eraserhd/parinfer-rust', {
      \ 'do': 'cargo build --release',
      \ 'for': ['lisp', 'scheme']
      \ }
call plug#end()

"" ============================================================================
"" Environment
"" ============================================================================

" Remote session: gates clipboard, key timeouts and the yank hook
let s:ssh = !empty($SSH_TTY) || !empty($SSH_CONNECTION)

let g:fd_cmd = executable('fd') ? 'fd' : executable('fdfind') ? 'fdfind' : ''
let g:file_list_cmd = empty(g:fd_cmd)
      \ ? "find . -type f -not -path '*/.git/*'"
      \   . " -not -path '*/.hg/*' -not -path '*/.jj/*'"
      \ : g:fd_cmd . ' --type f'

let s:has_ctags = executable('ctags')
      \ && system('ctags --version 2>&1') =~? 'universal\|exuberant'

"" ============================================================================
"" Options
"" ============================================================================

set mouse=nvi
set ttymouse=sgr
set backspace=2
set timeoutlen=300

let &ttimeoutlen = s:ssh ? 100 : 50
if s:ssh || !has('clipboard')
  set clipboard=
else
  let &clipboard = has('macunix') ? 'unnamed' : 'unnamedplus'
endif

"" File Management
set hidden
set autoread
set autowriteall
set undofile
set tags=./tags;,tags

let s:state = expand('~/.vim/state')
for s:d in ['swap', 'undo', 'backup']
  silent! call mkdir(s:state . '/' . s:d, 'p', 0700)
endfor
let &directory = s:state . '/swap//'
let &undodir   = s:state . '/undo'
let &backupdir = s:state . '/backup//'

set viminfo='100,<50,s10

let g:bigfile_bytes = 5 * 1024 * 1024
let g:bigfile_lines = 50000

"" UI
set termguicolors
set background=dark
let g:codedark_conservative = v:true

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

"" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
if executable('rg')
 let &grepprg = join([
        \   'rg --vimgrep --smart-case --hidden',
        \   '--glob=!.git --glob=!.hg --glob=!.jj',
        \ ])
  set grepformat=%f:%l:%c:%m
endif

"" Indentation
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
set complete-=i
set complete-=t

"" ============================================================================
"" Plugin Settings
"" ============================================================================

let g:netrw_banner = v:false

" ALE
let g:ale_disable_lsp = v:true
let g:ale_maximum_file_size = 2 * 1024 * 1024
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = v:false
let g:ale_lint_on_enter = v:false

let g:ale_set_quickfix = v:true
let g:ale_open_list = v:true
let g:ale_loclist_msg_format = '[%linter%] %s (%code%)'

let g:ale_virtualtext_cursor = v:false
let g:ale_set_signs = v:false
let g:ale_set_highlights = v:false
let g:ale_echo_msg_format = ''

let g:ale_linters = {
      \   'c': ['cppcheck'],
      \   'cpp': ['cppcheck'],
      \   'python': ['ruff'],
      \   'sh': ['shellcheck'],
      \}

let g:ale_fix_on_save = v:false
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'json': ['jq'],
      \   'python': ['ruff_format'],
      \   'sh': ['shfmt'],
      \}

" Gutentags
let g:gutentags_enabled = s:has_ctags
let g:gutentags_cache_dir = expand('~/.tags')
let g:gutentags_project_root = ['.jj']
let g:gutentags_generate_on_new = 0
let g:gutentags_exclude_project_root = [$HOME, '/usr/local', '/opt/homebrew']
let g:gutentags_exclude_filetypes = [
      \   'text', 'markdown', 'gitcommit', 'log', 'qf', 'help'
      \ ]
let g:gutentags_ctags_extra_args =
      \ filereadable(expand('~/.ctags'))
      \ ? ['--options=' . expand('~/.ctags')] : []
if !empty(g:fd_cmd)
  let g:gutentags_file_list_command =
        \ g:fd_cmd . ' --type f --no-follow --exclude .git'

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
let g:slime_target = "vimterminal"
let g:slime_python_ipython = v:true
let g:slime_input_pid = v:false
let g:slime_suggest_default = v:true
let g:slime_menu_config = v:true

" Parinfer
let g:parinfer_mode = "smart"

" OSCYank
let g:oscyank_max_length = 1000000

"" ============================================================================
"" Statusline
"" ============================================================================

let s:mode_map = {
      \   'n': 'NORMAL', 'i': 'INSERT', 'ic': 'INSERT', 'ix': 'INSERT',
      \   'v': 'VISUAL', 'V': 'VISUAL', "\<C-v>": 'VISUAL',
      \   's': 'SELECT', 'S': 'SELECT', "\<C-s>": 'SELECT',
      \   'R': 'REPLACE', 'Rx': 'REPLACE', 'Rc': 'REPLACE', 'Rv': 'REPLACE',
      \   'c': 'COMMAND', 'cv': 'EX', 'ce': 'EX',
      \   'r': 'PROMPT', 'rm': 'PROMPT', 'r?': 'PROMPT', 't': 'TERMINAL'
      \}

function! StatuslineMode() abort
  return get(s:mode_map, mode(), 'OTHER')
endfunction

let &statusline = '%2* %{StatuslineMode()} %1* %f%m%r%=%*%2* %y '

function! ApplyCustomHighlights() abort
  hi StatusLine    guibg=#1e1e1e guifg=#999999 ctermbg=234 ctermfg=246
  hi StatusLineNC  guibg=#121212 guifg=#4e4e4e ctermbg=233 ctermfg=239

  hi StatusLineTerm    guibg=#0a4d8c guifg=#ffffff
        \ ctermbg=24  ctermfg=15 gui=bold cterm=bold
  hi StatusLineTermNC  guibg=#121212 guifg=#4e4e4e ctermbg=233 ctermfg=239

  hi User1         guibg=#181818 guifg=#cccccc ctermbg=233 ctermfg=251
  hi User2         guibg=#0a4d8c guifg=#ffffff
        \ ctermbg=24  ctermfg=15 gui=bold cterm=bold

  hi! MatchParen   guifg=#569cd6 guibg=NONE    ctermfg=75
        \ ctermbg=NONE gui=bold
  hi Search        guibg=#264f78 guifg=NONE    ctermbg=24  ctermfg=NONE
  hi QuickFixLine  guibg=#264f78 guifg=NONE    ctermbg=24  ctermfg=NONE
endfunction

"" ============================================================================
"" Custom Functions
"" ============================================================================

function! FzyCommand(choice_command, vim_command) abort
  let output = ''
  try
    let output = system(a:choice_command . " | fzy")
  catch /Vim:Interrupt/
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . fnameescape(trim(output))
  endif
endfunction

function! AutoSaveWinView() abort
  let w:SavedBufView = get(w:, 'SavedBufView', {})
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

function! AutoRestoreWinView() abort
  let buf = bufnr("%")
  if has_key(get(w:, 'SavedBufView', {}), buf)
    let v = winsaveview()
    if v.lnum == 1 && v.col == 0 && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

function! SendFileToSlime()
  let l:path = expand('%:p')
  let l:ft = &filetype
  let l:lisp = '(load "' . escape(l:path, '\"') . '")' . "\n"

  let l:cmds = {
        \   'python': '%run -i ' . shellescape(l:path) . "\n",
        \   'lisp':   l:lisp,
        \   'scheme': l:lisp,
        \   'sql':    "\\i '" . substitute(l:path, "'", "''", 'g') . "'\n",
        \   'sh':     'source ' . shellescape(l:path) . "\n",
        \ }

  if has_key(l:cmds, l:ft)
    call slime#send(l:cmds[l:ft])
  endif
endfunction

function! DeleteOtherBuffers() abort
  let l:current = bufnr('%')
  for l:buf in
        \ filter(range(1, bufnr('$')), 'bufexists(v:val) && buflisted(v:val)')
    if l:buf != l:current
      execute 'Bdelete ' . l:buf
    endif
  endfor
endfunction

function! s:BigFilePre(path) abort
  unlet! b:bigfile
  let l:size = getfsize(a:path)
  if l:size > g:bigfile_bytes || l:size == -2
    let b:bigfile = 1
    setlocal noundofile
  endif
endfunction

function! s:BigFilePost() abort
  if get(b:, 'bigfile') || line('$') > g:bigfile_lines
    let b:bigfile = 1
    setlocal noundofile foldmethod=manual nocursorline norelativenumber
    setlocal colorcolumn=
    syntax clear
  endif
endfunction

function! ToggleTagbarSafe() abort
  if get(b:, 'bigfile')
    echo 'bigfile: Tagbar skipped'
  else
    TagbarToggle
  endif
endfunction

"" ============================================================================
"" Autocommands
"" ============================================================================

augroup CustomAutocmds
  autocmd!
  autocmd VimResized * tabdo wincmd =
  autocmd FileType vim,css,html,javascript,json,pbtxt,markdown,c,cpp
        \ setlocal ts=2 sts=2 sw=2

  autocmd FileType qf setlocal cc= wrap linebreak
  autocmd FileType qf nnoremap <buffer><silent> <esc> :cclose <bar> lclose<cr>
  autocmd FileType tagbar nnoremap <buffer><silent> <esc> <c-w>c

  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()

  autocmd BufReadPre  * call s:BigFilePre(expand('<afile>'))
  autocmd BufReadPost * call s:BigFilePost()

  autocmd ColorScheme * call ApplyCustomHighlights()

  if s:ssh
    autocmd TextYankPost *
          \ if v:event.operator ==# 'y' && v:event.regname ==# ''
          \ && exists(':OSCYankRegister')
          \ | execute 'OSCYankRegister "' | endif
  endif
augroup END

"" ============================================================================
"" Key Mappings
"" ============================================================================

nnoremap Y y$
nnoremap zz zt
nnoremap zt zz
nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:echo ""<cr>
nnoremap <c-c> <c-c>

nnoremap <c-u> <nop>
nnoremap <c-x> :Bdelete<cr>
nnoremap <c-d> :call DeleteOtherBuffers()<cr>

cnoreabbrev <expr> ter (getcmdtype() == ':' && getcmdline() == 'ter') ?
      \ 'leftabove vert ter' : 'ter'
tnoremap <esc> <c-\><c-n>

if executable('fzy')
  nnoremap <c-p> :call FzyCommand(g:file_list_cmd, ":e")<cr>
endif
nnoremap == :ALEFix<cr>
nnoremap <c-o> :call ToggleTagbarSafe()<cr>

nnoremap <silent> <c-c><c-k> :call SendFileToSlime()<cr>
nnoremap <silent> <c-c><c-l> :call slime#send("\x0c")<cr>
nnoremap <silent> <c-c><c-u> :call slime#send("\x15")<cr>

colorscheme codedark
call ApplyCustomHighlights()
