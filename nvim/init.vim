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
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'wfxr/minimap.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Yggdroot/indentLine'
endif

" Neovim + VSCode extension
Plug 'wittyjudge/gruvbox-material.nvim'
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
nmap <silent> <A-Left> :bp<CR>
nmap <silent> <A-Right> :bn<CR>
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Left> <C-w>h

" Resize split
nnoremap <silent> <S-Up> :exe "resize -3"<CR>
nnoremap <silent> <S-Right> :exe "vertical resize +5"<CR>
nnoremap <silent> <S-Down> :exe "resize +3"<CR>
nnoremap <silent> <S-Left> :exe "vertical resize -5"<CR>

" Save and close
nmap <C-s> :w<CR>
nmap <silent> <C-q> :Bdelete<CR>
nnoremap <leader>s :SudaWrite<CR>
nnoremap <leader>w :SudaWrite<CR>
nnoremap <leader>q :q!<CR>

" Toggle nerd tree but find the open file
nnoremap <silent> <expr> <F3> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" Toggle comment
map <silent> <C-_> :call nerdcommenter#Comment(1, 'toggle')<CR>

" Toggle indent line
nmap <leader>g :IndentLinesToggle<CR>

" Error list
nmap <leader>e :CocList diagnostics<CR>

" Commands cuz I can't write
:command W w
:command Q q
:command Wq wq
:command WQ wq

" Fuzzy find
" Customize the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add and AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --no-ignore' }), <bang>0))

nmap <leader>f :Files<CR>
nmap <leader>F :AllFiles<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>

" ------------------------------------------------------------------------
"  VIM configuration
"  ------------------------------------------------------------------------

" Set theme
set termguicolors
colorscheme gruvbox-material

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

" Preserve undo history
set undofile
set undodir=~/.cache/nvim/history/

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

" Exit Vim if NERDTree or Minimap are the only windows remaining
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \ bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__' ||
          \ bufname(winbufnr(i)) == '-MINIMAP-'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

" Airline config
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Ale config
let g:ale_linters = {
\   'python': ['flake8', 'autopep8'],
\   'markdown': ['markdownlint'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'json': ['jq'],
\   'html': ['html-beautify'],
\   'htmldjango': ['html-beautify'],
\   'javascript': ['prettier', 'deno'],
\   'scss': ['prettier'],
\   'css': ['prettier'],
\   'sh': ['shfmt'],
\   'yaml': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" ALE config
let g:ale_fix_on_save = 1

" CoC config
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Minimap config
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1

" Indent guides
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0

" Other plugins config
filetype plugin on

" Enable rainbow
let g:rainbow_active = 1
