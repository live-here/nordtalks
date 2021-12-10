" BASICS
syntax on
set cursorline
set hlsearch
set incsearch
set lazyredraw
set number
set relativenumber
set showcmd
set showmatch
set smartcase
set tabstop=2
set conceallevel=0
set concealcursor=
set encoding=utf-8
set fileencoding=utf-8

" SHORTCUTS
nnoremap <C-l> :NERDTree<CR>
nnoremap <C-f> :YcmC FixIt<CR>
nnoremap <C-d> :YcmC GoToDefinition<CR>
nnoremap <C-D> :YcmC GoToDeclaration<CR>
nnoremap <C-t> :YcmC GetType<CR>
nnoremap <C-e> :YcmShowDetailedDiagnostic<CR>

ca yfi YcmC FixIt
ca ygt YcmC GetType
ca ygd YcmC GoToDefinition
ca ygD YcmC GoToDeclaration

" THEME
set background=dark
set notermguicolors
set t_Co=16
colorscheme noctu

set list
set listchars=tab:¦\ ,trail:·,eol:↵

" PLUGINS
call plug#begin('~/.local/share/nvim/plug')

" functionality
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'rockerbacon/vim-noctu', {
	\ 'do': 'rm -f ~/.config/nvim/colors && ln -s ~/.local/share/nvim/plug/vim-noctu/colors ~/.config/nvim/colors'
	\ }
Plug 'derekprior/vim-trimmer'
Plug 'tpope/vim-sleuth'
Plug 'valloric/youcompleteme', { 'do': 'python3 install.py --ts-completer' }

call plug#end()

" PLUGINS CONFIGS
" ctrlvim/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" yggdroot/indentline
let g:indentLine_enabled = 1
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_char = '⋮'
let g:indentLine_first_char = '⋮'
let g:indentLine_color_gui = '#073642'
au FileType json let g:indentLine_setConceal = 0

" scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" valloric/youcompleteme
if exists('g:vscode')
	let g:loaded_youcompleteme = 1
endif

filetype indent on
filetype plugin on

