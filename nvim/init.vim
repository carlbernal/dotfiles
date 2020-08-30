call plug#begin('~/.local/share/nvim/plugged')

"" essentials"

" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" visual
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'doums/darcula'

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

"" optionals"

" async dispatcher
Plug 'tpope/vim-dispatch' 

" linting engine
Plug 'dense-analysis/ale'

" fuzzy search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show git status in gutter
Plug 'airblade/vim-gitgutter'

" alternate between .c .h files using :A
Plug 'vim-scripts/a.vim' 

call plug#end()

""" settings
let g:loaded_matchparen=1
set number relativenumber
set hidden
" set mouse=n
set mouse=a
set clipboard+=unnamedplus
set ruler

" visual
filetype plugin indent on
syntax on
colorscheme darcula
set termguicolors
set colorcolumn=80
set guicursor= 
set cmdheight=2
set signcolumn=yes

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" default tabs and indent
set smarttab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2

""" Plugins settings

" python
let g:python_highlight_all = 1

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_leader_key=','

" indentLine
let g:indentLine_char_list = ['⎸']

" lightline
let g:lightline = { 'colorscheme': 'darculaOriginal' }
let g:lightline#bufferline#enable_devicons=1

" fzf
let g:fzf_nvim_statusline=0

" fzf window
nnoremap <silent><C-p> :FZF<CR>
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
	" position
	let height = float2nr(30)
	let width = float2nr(70)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = float2nr(5 / 2)
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\ }

	" border
	let top = "╭" . repeat("─", width - 2) . "╮"
	let mid = "│" . repeat(" ", width - 2) . "│"
	let bot = "╰" . repeat("─", width - 2) . "╯"
	let lines = [top] + repeat([mid], height - 2) + [bot]
	let s:buf = nvim_create_buf(v:false, v:true)
	call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
	call nvim_open_win(s:buf, v:true, opts)
	set winhl=Normal:Floating
	let opts.row += 1
	let opts.height -= 2
	let opts.col += 2
	let opts.width -= 4

	call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
	au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" dispatcher
autocmd FileType python let b:dispatch = 'python3 %'
autocmd FileType sh let b:dispatch = 'sh %'
autocmd FileType javascript let b:dispatch = 'node %'

" ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_python_auto_pipenv = 1 " detect pip env without sourcing it
let g:ale_go_golangci_lint_executable = 'golangci-lint'
let g:ale_linters = {
			\ 'cpp': ['clangtidy'],
			\ 'c': ['clangtidy'],
			\ 'python': ['flake8'],
			\ 'sh': ['shellcheck'],
			\ 'javascript': ['tsserver'],
			\ 'typescript': ['tsserver'],
			\ 'json': ['jq'],
			\}
let g:ale_fixers = {
			\ 'go': ['gofmt'],
			\ 'cpp': ['clang-format'],
			\ 'c': ['clang-format'],
			\ 'python': ['autopep8', 'isort'],
			\ 'javascript': ['prettier'],
			\ 'typescript': ['prettier'],
			\ 'html': ['prettier'],
			\ 'css': ['prettier'],
			\ 'scss': ['prettier'],
			\ 'sass': ['prettier'],
			\ 'json': ['jq'],
			\}
nmap == :ALEFix<CR>
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" coc

" use tab to cycle completion
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" use enter to confirm completion
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : 
				\ "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" use preview window for documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

""" Custom shortcuts
nnoremap <C-s> :update<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>

""" Darcula helper groups

" coc
hi! link CocErrorSign ErrorSign
hi! link CocWarningSign WarningSign
hi! link CocInfoSign InfoSign
hi! link CocHintSign InfoSign
hi! link CocErrorFloat Pmenu
hi! link CocWarningFloat Pmenu
hi! link CocInfoFloat Pmenu
hi! link CocHintFloat Pmenu
hi! link CocHighlightText IdentifierUnderCaret
hi! link CocHighlightRead IdentifierUnderCaret
hi! link CocHighlightWrite IdentifierUnderCaretWrite
hi! link CocErrorHighlight CodeError
hi! link CocWarningHighlight CodeWarning
hi! link CocInfoHighlight CodeInfo
hi! link CocHintHighlight CodeHint

" ale
hi! link ALEError Error
hi! link ALEWarning CodeWarning
hi! link ALEInfo CodeInfo
hi! link ALEErrorSign ErrorSign
hi! link ALEWarningSign WarningSign
hi! link ALEInfoSign InfoSign

" git gutter
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'
