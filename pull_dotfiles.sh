# My dotfiles #

## NixOS ##
cp -r /etc/nixos .

## Nvchad ##
rm -r nvim/lua/custom && cp -r ~/.config/nvim/lua/custom nvim/lua/

## Vifm ##
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
