
# --------------- 
# Command history 
# --------------- 
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
