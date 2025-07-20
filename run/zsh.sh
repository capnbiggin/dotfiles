#!/usr/bin/env bash

NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'

CDIR=$(pwd)

set -e

cd ~

printf "${YELLOW}Checking if Z Shell is inatalled.${NC}\n"
if ! command -v zsh &> /dev/null; then
  printf "${BLUE}installing Z Shell, which and Stow GNU${NC}/n"
  sudo pacman -S --needed --noconfirm zsh which stow
  sleep 0.2
  if [[ ! -d "$ZDOTDIR" ]] || [[ ! -f "~/.zshrc" ]]; then
    printf "${BLUE}putting zsh config files in the correct place for these dotfiles.${NC}/n"
  else
    printf "${RED}Removing old Z Shell configs.${NC}\n"
    rm -rf $ZDOTDIR/.zshrc $ZDOTDIR/.zprofile ~/.zshrc ~/.zprofile ~/.zshenv
  fi

  printf "${BLUE}making directory for the Z Shell config files and plugins${NC}\n"
  mkdir -p ~/.config/zsh/plugins/
  sleep 0.2

  printf "${BLUE}Cloning plugin zsh-syntax-highlighting${NC}\n"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
  sleep 0.2
  printf "${BLUE}Cloning plugin zsh-autosuggestions${NC}\n"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions/
  sleep 0.2
  printf "${BLUE}Cloning plugin zsh-you-should-use${NC}\n"
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/zsh/plugins/zsh-you-should-use/
  sleep 0.2
  printf "${BLUE}Cloning plugin zsh-history-substring-search${NC}\n"
  git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/zsh/plugins/zsh-history-substring-search/
  sleep 0.2
  printf "${BLUE}Cloning plugin pure prompt${NC}\n"
  git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure/

  cd ~/dotfiles/
  stow zsh

  cd ${CDIR}

  hash -r
  chsh -s $(which zsh)

else
  printf "${GREEN}Z Sheel is already instaled.\n"
  printf "If you wish to use these dotfiles please run the next line, then run this script again.${NC}\n"
  printf "${YELLOW}chsh /bin/bash & sudo pacman -R zsh${NC}\n"

fi


exit
