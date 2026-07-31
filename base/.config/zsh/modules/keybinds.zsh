
# -------- 
# Keybinds 
# -------- 
# Navigation
bindkey '^A' beginning-of-line           # Ctrl+A
bindkey '^E' end-of-line                 # Ctrl+E
bindkey '^[[1;5C' forward-word          # Ctrl+Right
bindkey '^[[1;5D' backward-word         # Ctrl+Left
bindkey '^[[H' beginning-of-line        # Home
bindkey '^[[F' end-of-line              # End
bindkey '^[[3~' delete-char             # Delete
bindkey '^K' kill-line                  # Kill to end of line
bindkey '^U' kill-whole-line            # Kill entire line

# History navigation
bindkey '^P' up-line-or-history         # Ctrl+P (like Vim)
bindkey '^N' down-line-or-history       # Ctrl+N (like Vim)
bindkey '^S' history-incremental-search-forward  # Ctrl+S

# Custom: FZF history search on Ctrl+R
bindkey '^R' fzf_history_search

