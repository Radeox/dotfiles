function! myspacevim#after() abort
  " Tab settings
  set expandtab
  set tabstop=4
  set shiftwidth=4

  " Move text and rehighlight
  vnoremap > ><CR>gv
  vnoremap < <<CR>gv

  " Copy to system clipboard
  set clipboard=unnamedplus
endfunction
