call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-sensible'

call plug#end()

" Nerdtree shortcut
nnoremap <F3> :NERDTreeToggle<CR>

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

" Copy to system clipboard
set clipboard=unnamedplus

set history=1000
set number
colorscheme 0x7A69_dark
colorscheme gruvbox

syntax on
set synmaxcol=2048
set backspace=indent,eol,start

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" Other stuff
set showmatch
set showmode

" Sudo save file
cmap w!! w !sudo tee % >/dev/null
