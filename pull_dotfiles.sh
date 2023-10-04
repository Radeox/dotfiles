# My dotfiles #

## NixOS ##
cp -r /etc/nixos .

## LunarVim ##
rm -r lvim && cp -r ~/.config/lvim . && rm lvim/lazy-lock.json

## Vifm ##
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
