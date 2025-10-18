#!/usr/bin/env bash

C='\033[0m'
G='\033[0;32m'
R='\033[0;31m'
B='\033[0;34m'
Y='\033[0;33m'

CDIR=$(pwd)

set -e

pushd ~

printf "\n${B}installing Z Shell, which and Stow GNU${C}/n"
sudo pacman -S --needed --noconfirm zsh which
sleep 0.2
printf "\n${R}Removing old Z Shell configs.${C}\n"
[ -f ~/.zshrc ] && rm -rf ~/.zshrc ~/.zprofile
[ -f ~/.zshenv ] && rm -rf ~/.zshenv
[ -f $ZDOTDIR/.zshrc ] && rm -rf $ZDOTDIR/.zshrc $ZDOTDIR/.zprofile

printf "\n${G}Changing default shell to zsh${C}\n"
hash -r
chsh -s $(which zsh)

sleep 0.2

popd
