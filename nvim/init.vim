" ------------------------------------------------------------------------
" Plugin configuration
" ------------------------------------------------------------------------

" Automatically install vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute "!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Plugin list
call plug#begin('~/.config/nvim/plugged')

" If not running inside VSCode
if !exists('g:vscode')
    " Neovim extensions
    Plug 'dense-analysis/ale'
    Plug 'famiu/bufdelete.nvim'
    Plug 'github/copilot.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'luochen1990/rainbow'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Xuyuanp/nerdtree-git-plugin'
endif

" Neovim + VSCode extension
Plug 'dracula/vim'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-sensible'

call plug#end()

" ------------------------------------------------------------------------
" Shortcuts
" ------------------------------------------------------------------------

" Leader key
let mapleader = "\<space>"

" Run commands
nnoremap <F1> :terminal 
nnoremap <F5> :make start<CR>
nnoremap <F6> :make restart<CR>
nnoremap <F7> :make stop<CR>
nnoremap <C-S-i> :ALEFix<CR>

" Move between windows and buffers
nmap <silent> <C-l> :bn<CR>
nmap <silent> <C-h> :bp<CR>
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Left> <C-w>h

" Save and close
nmap <C-s> :w<CR>
nmap <silent> <C-q> :Bdelete<CR>
nnoremap <leader>s :SudaWrite<CR>
nnoremap <leader>q :q!<CR>

" Fuzzy find
" Customize the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add and AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --no-ignore' }), <bang>0))

nmap <leader>e :Files<CR>
nmap <leader>E :AllFiles<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

" Toggle nerd tree but find the open file
nnoremap <silent> <expr> <F3> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" Toggle comment
map <silent> <C-_> :call nerdcommenter#Comment(1, 'toggle')<CR>

" ------------------------------------------------------------------------
"  VIM configuration
"  ------------------------------------------------------------------------

" Set theme
set termguicolors
colorscheme dracula

" Move text and rehighlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Use system clipboard
set clipboard+=unnamedplus

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Enable syntax
syntax on
set synmaxcol=2048
set backspace=indent,eol,start

" Tab settings
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Other stuff
set cursorline
set autoread
set showmatch
set noshowmode
set history=1000
set number

" ------------------------------------------------------------------------
"  Plugin specific configuration
"  ------------------------------------------------------------------------

" NERDTree config 
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" Start NERDTree when Vim starts with a directory argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Airline config
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Ale config
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

" Other plugins config
filetype plugin on

" Enable rainbow
let g:rainbow_active = 1

" Hide tiles in ruler
hi NonText guifg=bg

" Set darker background
hi Normal guibg=#1E1F28
