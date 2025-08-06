#!/usr/bin/env bash

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed vim nvim luarocks tree-sitter-cli

  rm -rf ~/.config/nvim
  ln -s ~/.local/share/capndot/config/nvim ~/.config/nvim
fi
