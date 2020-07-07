if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" misc
Plug 'psliwka/vim-smoothie'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'

" sidebars
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'

" visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

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

" linting engine
Plug 'dense-analysis/ale'

" fuzzy search
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

""" basics
let g:loaded_matchparen=1
" set nowrap
autocmd Filetype qf setlocal wrap
set number relativenumber
set hidden
set mouse=n " use mouse in normal mode only
set clipboard+=unnamedplus
set updatetime=300

" visual
filetype plugin indent on
syntax on
colorscheme gruvbox
set guicursor= 
set colorcolumn=80
set cursorline
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

" sneak
let g:sneak#use_ic_scs=1

" smoothie
let g:smoothie_no_default_mappings = 1
silent! nmap <unique> <C-j> <Plug>(SmoothieDownwards)
silent! nmap <unique> <C-k> <Plug>(SmoothieUpwards)

" nerdtree
nmap <leader>f :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1

" tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_show_visibility = 0
let g:tagbar_width = 30
let g:tagbar_sort = 0

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" custom airline extensions settings
let g:airline#extensions#tagbar#enabled = 0

" fzf
let g:fzf_nvim_statusline=0
nnoremap <silent><C-p> :FZF<CR>
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" fzf window implementation
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
autocmd BufEnter *.md ALEDisable " fix ale bug on markdown files
autocmd BufEnter *.html ALEDisable 
let g:ale_linters = {
			\ 'python': ['pylint'],
			\ 'sh': ['shellcheck'],
			\ 'json': ['jq'],
			\ 'javascript': ['tsserver'],
			\ 'typescript': ['tsserver'],
			\ 'go': ['golint'],
			\}
let g:ale_fixers = {
			\ 'javascript': ['prettier'],
			\ 'typescript': ['prettier'],
			\ 'python': ['autopep8', 'isort'],
			\ 'go': ['gofmt', 'goimports'],
			\}
let g:ale_fix_on_save = 1
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
nmap <leader>rn <Plug>(coc-rename)

""" Custom shortcuts
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
