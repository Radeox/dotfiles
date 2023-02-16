" If not running inside VSCode
if !exists('g:vscode')
    source $HOME/.config/nvim/neo.vim
else
    source $HOME/.config/nvim/vscode.vim
endif
