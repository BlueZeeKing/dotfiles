#!/usr/bin/env zsh

stow alacritty
stow atuin
stow gh
stow lazygit
stow nvim
stow scripts
stow starship
stow tmux
stow zsh
stow dunst
stow hypr
stow waybar

mkdir ~/zsh-plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/zsh-plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git ~/zsh-plugins/spaceship
