#!/usr/bin/env bash

C='\033[0m'
B='\033[0;34m'

mkdir -p ~/.config/zsh/plugins

printf "\n${B}Cloning plugin zsh-syntax-highlighting${C}\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting/
sleep 0.2
printf "\n${B}Cloning plugin zsh-autosuggestions${C}\n"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions/
sleep 0.2
printf "\n${B}Cloning plugin zsh-you-should-use${C}\n"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.config/zsh/plugins/zsh-you-should-use/
sleep 0.2
printf "\n${B}Cloning plugin zsh-history-substring-search${C}\n"
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.config/zsh/plugins/zsh-history-substring-search/
sleep 0.2
printf "\n${B}Cloning plugin pure prompt${C}\n"
git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/plugins/pure/
