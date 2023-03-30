#!/usr/bin/bash

# ZSH ##
cp ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml

## Aliases ##
cp ~/.aliases ~/.zshrc zsh/

## Nvchad ##
rm -r nvim/lua/custom && cp -r ~/.config/nvim/lua/custom nvim/lua/

## Vifm ##
rm -r vifm && cp -r ~/.config/vifm . && rm vifm/vifminfo.json
