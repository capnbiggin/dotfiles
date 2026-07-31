
# ------------------ 
# Completion styling 
# ------------------ 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# ------------ 
# Load Comp
# ------------ 
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
