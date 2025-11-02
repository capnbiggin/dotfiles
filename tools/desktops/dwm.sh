#!/usr/bin/env bash

UTILS=(
  git
  curl
  wget
  zip
  unzip
  firefox
  )

BDETS=(
  base-devel
  libx11
  libxft
  freetype2
  fontconfig
  )

XORG=(
  xorg-server
  xorg-xinit
  xorg-xrandr
  xorg-xsetroot
  )

cd ~

for pkg in "${UTILS[@]}"; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done

for pkg in "${BDETS[@]}" ; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done


for pkg in "${XORG[@]}" ; do
  sudo pacman -S --needed --noconfirm "$pkg" ||
    printf "\n${R}Failed to install $pkg. Continuing without!${C}\n"
done

mkdir -p ~/.local/share/suckless

git clone git@github.com:capnbiggin/suckless.git ~/.local/share/suckless

cd ~/.local/share/suckless/dwm

sudo make clean install

cd ~/.local/share/suckless/dmenu

sudo make clean install

cd ~/.local/share/suckless/st

sudo make clean install

cd ~
