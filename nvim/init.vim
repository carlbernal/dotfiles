call plug#begin('~/.local/share/nvim/plugged')

"" essentials"

" misc
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psliwka/vim-smoothie'

" visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasr/molokai'

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

" linting engine
Plug 'dense-analysis/ale'

" fuzzy search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""" basics
let g:loaded_matchparen=1
set number relativenumber
set hidden
set mouse=n
set clipboard+=unnamedplus

" visual
filetype plugin indent on
syntax on
colorscheme molokai
let g:molokai_original=1
set termguicolors
set guicursor= 
set colorcolumn=80
set cursorline
set cmdheight=2

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

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" fzf
let g:fzf_nvim_statusline=0

" fzf window
nnoremap <silent><C-p> :FZF<CR>
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')
	let height = float2nr(15)
	let width = float2nr(80)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = float2nr(height / 2)
	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\ }
	call nvim_open_win(buf, v:true, opts)
endfunction

" ale
let g:ale_linters = {
			\ 'python': ['flake8'],
			\ 'sh': ['shellcheck'],
			\ 'json': ['jq'],
			\ 'javascript': ['tsserver'],
			\ 'typescript': ['tsserver'],
			\}
let g:ale_fixers = {
			\ 'python': ['autopep8', 'isort'],
			\ 'javascript': ['prettier'],
			\ 'typescript': ['prettier'],
			\}
nmap == :ALEFix<CR>
let g:ale_python_auto_pipenv = 1
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" coc

" use tab  for completion
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

" Use enter to confirm completion
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

" coc shortcuts
nmap R <Plug>(coc-rename)

""" Custom shortcuts
nnoremap <C-s> :update<CR>
nnoremap <C-w> :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
