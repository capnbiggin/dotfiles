#!/usr/bin/env bash

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed vim neovim luarocks tree-sitter-cli

fi
