call plug#begin('~/.local/share/nvim/plugged')

Plug 'psliwka/vim-smoothie'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'

" visual plugins
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'

" custom text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" searching
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" code snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'justinmk/vim-sneak'

" language supports
Plug 'sheerun/vim-polyglot',
Plug 'fatih/vim-go',

" autocomplete engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" linting engine
Plug 'dense-analysis/ale'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

"" looks
filetype plugin indent on
syntax on
colorscheme molokai
let g:molokai_original=1
set termguicolors
set laststatus=2
set cursorline
set colorcolumn=80

" visualize whitespace
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
let g:indentLine_char_list = ['⎸']

"" basics
let g:loaded_matchparen=1 " ignore paired paren highlight
set nowrap
set number relativenumber
set hidden
set mouse=a
set clipboard+=unnamedplus
set completeopt-=preview
set completeopt=noinsert,menuone,noselect
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
set shiftwidth=4
set tabstop=4

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

"" plugin settings

" python
let g:python_highlight_all = 1

" emmet
let g:user_emmet_leader_key=','

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" fzf
let g:fzf_nvim_statusline = 0
nnoremap <silent><C-p> :FZF<CR>
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" create floating window for fzf
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

" smoothie
let g:smoothie_no_default_mappings = 1
silent! nmap <unique> <C-j> <Plug>(SmoothieDownwards)
silent! nmap <unique> <C-k> <Plug>(SmoothieUpwards)

" sneak kana mode
" let g:sneak#label = 1

" nerdtree
nmap <leader>f :NERDTreeToggle<cr>
let NERDTreeMinimalUI=1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay=0
let g:deoplete#auto_refresh_delay=0
call deoplete#custom#option({
			\ "min_pattern_length": 0,
			\ "smartcase": 1,
			\ })

inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" ultisnips
let g:UltiSnipsExpandTrigger='<Leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<Leader>j' " next
let g:UltiSnipsJumpBackwardTrigger='<Leader>k' " prev

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_linters = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['tsserver'],
			\ 'python': ['pylint'],
			\ 'go': ['golangci-lint'],
			\}

let g:ale_fixers = {
			\ 'javascript': ['eslint'],
			\ 'typescript': ['prettier'],
			\ 'python': ['autopep8', 'isort'],
			\ 'go': ['gofmt', 'goimports'],
			\}
let g:ale_fix_on_save = 1

" custom shorutcuts
nnoremap <silent><C-S> :update<CR>
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
