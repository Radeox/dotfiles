# My dotfiles #

## NixOS ##
cp -r /etc/nixos .

## Alacritty ##
cp ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml

## Nvchad ##
rm -r nvim/lua/custom && cp -r ~/.config/nvim/lua/custom nvim/lua/

## Vifm ##
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
