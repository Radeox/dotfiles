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

" Neovim extensions
" Don't enable plugins in vscode
if !exists('g:vscode')
    Plug 'ap/vim-css-color'
    Plug 'dense-analysis/ale'
    Plug 'github/copilot.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'lambdalisue/suda.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'luochen1990/rainbow'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdcommenter'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'szw/vim-maximizer'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'wfxr/minimap.vim'
    Plug 'wittyjudge/gruvbox-material.nvim'
    Plug 'yggdroot/indentline'
endif

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
nmap <silent> <S-A-Left> gT
nmap <silent> <S-A-Right> gt
nnoremap <silent> <C-Up> <C-w>k
nnoremap <silent> <C-Right> <C-w>l
nnoremap <silent> <C-Down> <C-w>j
nnoremap <silent> <C-Left> <C-w>h

" Maximize current split
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>v :vs<CR>
nnoremap <leader>s :sp<CR>

" Move file to new tab
nnoremap <leader>t :tabedit %<CR>

" Save and close
nmap <C-s> :w<CR>
nmap <silent> <C-q> :bd<CR>
nnoremap <leader>w :SudaWrite<CR>

" Toggle nerd tree but find the open file
nnoremap <silent> <expr> <F3> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'

" Toggle comment
map <silent> <C-/> :call nerdcommenter#Comment(1, 'toggle')<CR>

" Toggle indent line
nmap <leader>g :IndentLinesToggle<CR>

" Show minimap
nnoremap <leader>n :MinimapToggle<CR>

" Commands cuz I can't write
:command W w
:command Q q
:command Wq wq
:command WQ wq

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

" Cursor configuration
set mouse=a
set guicursor+=a:blinkon0

" ------------------------------------------------------------------------
"  Plugin configuration
"  ------------------------------------------------------------------------

" Airline config
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Ale config
let g:ale_linters = {
\   'html': ['tidy'],
\   'markdown': ['markdownlint'],
\   'python': ['flake8', 'autopep8'],
\}

let g:ale_fixers = {
\   'css': ['prettier'],
\   'html': ['html-beautify'],
\   'htmldjango': ['html-beautify'],
\   'javascript': ['prettier', 'deno'],
\   'json': ['jq'],
\   'php': ['php_cs_fixer'],
\   'python': ['black', 'isort'],
\   'scss': ['prettier'],
\   'sh': ['shfmt'],
\   'yaml': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" ALE config
let g:ale_fix_on_save = 1

" NerdTree config
let g:NERDTreeWinSize = 22

" CoC config
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Enter to accept autocomplete
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Minimap config
let g:minimap_width = 10
let g:minimap_highlight_search = 1
let g:minimap_git_colors = 1

" Indent guides
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0

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

" NERDTree config
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" Maximizer config
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 1

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

" Shortcut helper
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" Jump to last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Other plugins config
filetype plugin on

" Enable rainbow
let g:rainbow_active = 1
