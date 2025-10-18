#!/usr/bin/env bash

# makeing ZDOTDIR directory for zsh plugins
mkdir -p ~/.config/zsh/plugins/

# Remove old zsh Configs
rm -rf ~/.zshenv
rm -rf ~/.config/zsh/.zshrc
rm -rf ~/.config/zsh/.zprofile

# Remove old bash Configs
rm -rf ~/.bashrc
rm -rf ~/.bash_profile

# Link Configs
cd ~/capndot
stow dotfiles
