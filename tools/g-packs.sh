#!/usr/bin/env bash

G_PACKS=(
  zip
  unzip
  tar
  wget
  git
  curl
  kate
  thunar
  obsidian
  google-chrome-canary
  gwenview
  flatpak
  light
)

for pak in "${G_PACKS[@]}"; do
  yay -S --needed --noconfirm $pak
done
