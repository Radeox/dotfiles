" ------------------------------------------------------------------------
" VSCode+NeoVim configuration
" ------------------------------------------------------------------------

" Move text and rehighlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Use system clipboard
set clipboard=unnamedplus

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

" Commands cuz I can't write
:command W w
:command Q q
