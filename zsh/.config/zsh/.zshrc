# ~/.config/zsh/.zshrc

# source global shell alias & variable files
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"


##################################
#      Enviroment Variables      #
##################################

export PATH="$HOME/.local/bin:$PATH"


export EDITOR=nvim

 #Command history
HISTFILE="$XDG_CACHE_HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt hist_ignore_space     # Don't save when prefixed with a space
setopt hist_ignore_all_dups  # Don't save duplicate lines
setopt hist_save_no_dups     # Don't save duplicate lines
setopt hist_ignore_dups      # Don't save duplicate lines
setopt hist_find_no_dups     # Don't show duplicates
setopt sharehistory          # Share history between sessins
setopt appendhistory         # Appends history insted of overwriting

unsetopt prompt_sp           # Don't autoclean blank line


# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache


# Load Modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

##################################
#           Prompt               #
##################################

fastfetch

PURE_GIT_PULL=0

fpath+=($HOME/.config/zsh/plugins/pure)

autoload -U promptinit; promptinit
prompt pure


#################################
#          Sources              #
#################################

# zsh plugins
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.config/zsh/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
