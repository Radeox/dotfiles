# My dotfiles #

## NixOS ##
cp -r /etc/nixos .

## AstroVim ##
rm -r astrovim && mkdir astrovim && cp -r ~/.config/nvim/ astrovim

## Vifm ##
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
