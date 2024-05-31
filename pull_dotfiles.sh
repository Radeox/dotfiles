# Pull dotfiles from system #

## NixOS ##
rm -r nixos && cp -r /etc/nixos .

## AstroVim ##
rm -r astrovim && mkdir astrovim && cp -r ~/.config/nvim/ astrovim
