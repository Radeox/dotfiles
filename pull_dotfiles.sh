# Pull my configuration (cuz I'm lazy)
cp ~/.config/kitty/kitty.conf kitty/kitty.conf
cp ~/.aliases ~/.zshrc zsh/
cp ~/.config/nvim/*.vim nvim/
cp -r ~/.config/waybar/ waybar/
cp -r ~/.config/hypr/ hypr/
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
