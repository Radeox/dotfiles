# Pull my configuration (cuz I'm lazy)
cp ~/.config/kitty/kitty.conf kitty/kitty.conf
cp ~/.my-aliases ~/.my-zshrc ~/.zshrc zsh/
cp ~/.config/nvim/init.vim nvim/
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
rm -r rofi && cp -r ~/.config/rofi .
