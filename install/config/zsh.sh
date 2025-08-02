#!/usr/bin/env bash

C='\033[0m'
G='\033[0;32m'
R='\033[0;31m'
B='\033[0;34m'
Y='\033[0;33m'

CDIR=$(pwd)

set -e

pushd ~

printf "\n${Y}Checking if Z Shell is inatalled.${C}\n"
if ! command -v zsh &>/dev/null; then
  printf "\n${B}installing Z Shell, which and Stow GNU${C}/n"
  sudo pacman -S --needed --noconfirm zsh which stow
  sleep 0.2
else
  printf "${R}Removing old Z Shell configs.${C}\n"
  rm -rf $ZDOTDIR/.zshrc $ZDOTDIR/.zprofile ~/.zshrc ~/.zprofile ~/.zshenv
fi

. zsh-plugins.sh

hash -r
chsh -s $(which zsh)

sleep 0.2

popd

printf "\n${G}You will now need to restart your PC to use Z Shell.${C}\n"

exit
