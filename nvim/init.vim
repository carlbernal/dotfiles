"" plugins
call plug#begin('~/.local/share/nvim/plugged')

" dependency
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kana/vim-textobj-user'
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'

" visual plugins
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'

" custom verbs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
" custom text objects
Plug 'kana/vim-textobj-entire'
Plug 'michaeljsmith/vim-indent-object'

" searching
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" code snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" js
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'pangloss/vim-javascript'

" python
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'

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

"" basics
let g:loaded_matchparen=1 " ignore paired paren highlight
set nowrap
set number relativenumber
set hidden
set mouse=a
set clipboard+=unnamedplus

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

"" plugin specifics

" vim airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" fzf
let g:fzf_nvim_statusline=0
nnoremap <silent><C-p> :FZF<CR>

" emmet
let g:user_emmet_leader_key=','

" smoothie
let g:smoothie_no_default_mappings=1
silent! nmap <unique> <S-j> <Plug>(SmoothieDownwards)
silent! nmap <unique> <S-k> <Plug>(SmoothieUpwards)

" ale
let g:airline#extensions#ale#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay=0
let g:deoplete#auto_refresh_delay=0
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" ultisnips
let g:UltiSnipsExpandTrigger='<Leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>' " next
let g:UltiSnipsJumpBackwardTrigger='<C-k>' " prev

" js ternjs settings
let g:deoplete#sources#ternjs#tern_bin = '/home/carlbernal/.nvm/versions/node/v13.3.0/lib/node_modules'
let g:deoplete#sources#ternjs#timeout=1
let g:deoplete#sources#ternjs#types=1
let g:deoplete#sources#ternjs#depths=1
let g:deoplete#sources#ternjs#case_insensitive=1
let g:deoplete#sources#ternjs#include_keywords=1

" python
let g:python_highlight_all = 1
let g:jedi#completions_enabled = 0
