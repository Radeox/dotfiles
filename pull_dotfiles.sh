# Pull my configuration (cuz I'm lazy)
cp ~/.config/kitty/kitty.conf kitty/kitty.conf
cp ~/.aliases ~/.zshrc zsh/
cp ~/.config/nvim/*.vim nvim/
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
