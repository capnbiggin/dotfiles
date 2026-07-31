
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS=" \
    --tmux 100%,80% --layout reverse --preview='bat --color=always {}' --border \
    --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
    --color=selected-bg:#45475A \
    --color=border:#313244,label:#CDD6F4"
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

function fzf_history_search() {
  local selected
  selected=$(fc -rl 1 | awk '{$1=""; print substr($0,2)}' | 
    fzf --height 40% --layout=reverse --border --color=border:blue \
        --preview='echo {}' --preview-window=down:3:wrap)
  LBUFFER=$selected
  zle reset-prompt
}
zle -N fzf_history_search
bindkey '^R' fzf_history_search
