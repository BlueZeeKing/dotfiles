#!/usr/bin/env zsh

stow --dotfiles atuin
stow --dotfiles nvim
stow --dotfiles scripts
stow --dotfiles starship
stow --dotfiles tmux
stow --dotfiles zsh
stow --dotfiles dunst
stow --dotfiles hypr
stow --dotfiles waybar
stow --dotfiles foot

mkdir ~/zsh-plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/zsh-plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git ~/zsh-plugins/spaceship
