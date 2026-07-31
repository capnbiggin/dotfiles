# ~/.config/zsh/.zshrc
local home_config="$HOME/.config"
local shell_con="$home_config/shell"
local zsh_con="$home_config/zsh"
local zmod="$zsh_con/modules"
# ------------------------------- 
# If not interactive. Do nothing. 
# ------------------------------- 
[[ $- != *i* ]] && return

[ -f /usr/bin/fastfetch ] && fastfetch
[ -f "$shell_con/aliases.sh" ] && source "$shell_con/aliases.sh"
[ -f "$zmod/env.zsh" ] && source "$zmod/env.zsh"
[ -f "$zmod/history.zsh" ] && source "$zmod/history.zsh"
[ -f "$zmod/keybinds.zsh" ] && source "$zmod/keybinds.zsh"
[ -f "$zmod/completion.zsh" ] && source "$zmod/completion.zsh"
[ -f "$zmod/prompt.zsh" ] && source "$zmod/prompt.zsh"
[ -f "$zmod/fzf.zsh" ] && source "$zmod/fzf.zsh"
[ -f "$zmod/zoxide.zsh" ] && source "$zmod/zoxide.zsh"
# [ -f "$zmod/tmux.zsh" ] && source "$zmod/tmux.zsh"
[ -f "$zmod/yazi.zsh" ] && source "$zmod/yazi.zsh"
[ -f "$zmod/nvm.zsh" ] && source "$zmod/nvm.zsh"
[ -f "$zmod/pnpm.zsh" ] && source "$zmod/pnpm.zsh"
[ -f "$zmod/bun.zsh" ] && source "$zmod/bun.zsh"

