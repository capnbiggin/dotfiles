#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'

CDIR=$(pwd)

cd ~

printf "${YELLOW}Checking if Z Shell is inatalled.${NC}\n"
if ! command -v zsh &> /dev/null; then
  printf "${BLUE}installing Z Shell, which and Stow GNU${NC}/n"
  sudo pacman -S --needed --noconfirm zsh which stow
  sleep 0.2
  if [[ ! -d "~/.config/zsh" ]]; then
    printf "${BLUE}putting zsh config files in the correct place for these dotfiles.${NC}/n"
  esle 
    printf "${RED}Removing old ZShell configs.${NC}\n"
    rm -rf ~/.config/zsh .zshrc .zprofile .zshenv
  fi

  mkdir -p ~/.config/zsh/plugins/
  sleep 0.2













mkdir -p ~/.config/zsh/plugins/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions/
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/zsh/plugins/zsh-you-should-use/
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/zsh/plugins/zsh-history-substring-search/
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure/

sudo pacman -S --needed --noconfirm zsh which
hash -r
chsh -s $(which zsh)

cd ~/dotfiles/
stow zsh

cd ${CDIR}
exit
