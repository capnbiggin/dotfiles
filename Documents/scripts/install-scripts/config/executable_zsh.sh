#!/usr/bin/env bash

source "$HOME/Documents/scripts/script-beginer.sh"

log_info "\nInstalling Z Shell./n"
sudo pacman -S --needed --noconfirm zsh which
sleep 0.2

log_info "\nChanging default shell to zsh.\n"
hash -r
chsh -s $(which zsh)
