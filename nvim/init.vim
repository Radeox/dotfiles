call plug#begin('~/.config/nvim/plugged')

Plug 'dense-analysis/ale'
Plug 'dracula/vim'
Plug 'famiu/bufdelete.nvim'
Plug 'github/copilot.vim'
Plug 'lambdalisue/suda.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" ---- Shortcuts ----
nnoremap <F1> :terminal 
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F5> :make start<CR>
nnoremap <F6> :make restart<CR>
nnoremap <F7> :make stop<CR>
nnoremap <C-S-i> :ALEFix<CR>
nmap <C-Right> :bn<CR>
nmap <C-Left> :bp<CR>
nmap <C-q> :Bdelete<CR>
nmap <C-s> :w<CR>
nmap <C-a> za
map <C-_> :call nerdcommenter#Comment(1, 'toggle')<CR>

" Tab settings
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Move text and rehighlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Use system clipboard
set clipboard+=unnamedplus

" Set theme
set termguicolors
colorscheme dracula

" Enable syntax
syntax on
set synmaxcol=2048
set backspace=indent,eol,start

" Folding settings
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Other stuff
set autoread
set showmatch
set noshowmode
set history=1000
set number

" ---- NERDTree config ----
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" Start NERDTree, unless a file or session is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ---- Airline config ----
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ---- Ale config ----
let g:ale_linters = {
\   'python': ['flake8', 'autopep8'],
\}

let g:ale_fixers = {
\   'python': ['autopep8', 'isort'],
\   'json': ['jq'],
\   'html': ['html-beautify'],
\   'htmldjango': ['html-beautify'],
\   'javascript': ['prettier'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\}

" ---- Other plugins config ----
filetype plugin on

" Enable rainbow
let g:rainbow_active = 1

" Hide tiles in ruler
hi NonText guifg=bg

" Set darker background
hi Normal guibg=#1E1F28
