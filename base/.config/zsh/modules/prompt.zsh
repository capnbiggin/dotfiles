
######################
#       Prompt       #
######################
if [[ -x $(command -v starship) ]]; then
  eval "$(starship init zsh)"
elif [[ -x $(command -v oh-my-posh) ]]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/myprompt.toml)"
else [[ -d $HOME/.config/zsh/plugins/pure ]]
  PURE_GIT_PULL=0

  fpath+=($HOME/.config/zsh/plugins/pure)

  autoload -U promptinit; promptinit
  prompt pure
fi

# ----------- #
# zsh plugins #
# ----------- #
[ -d $HOME/.config/zsh/plugins/zsh-syntax-highlighting ] && source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -d $HOME/.config/zsh/plugins/zsh-autosuggestions ] && source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -d $HOME/.config/zsh/plugins/plugins/zsh-history-substring-search ] && source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[ -d $HOME/.config/zsh/plugins/zsh-you-should-use ] && source $HOME/.config/zsh/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
