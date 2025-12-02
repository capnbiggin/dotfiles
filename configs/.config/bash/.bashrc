####################################
#           ~/.bashrc              #
####################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

blk='\[\033[01;30m\]' # Black
red='\[\033[01;31m\]' # Red
grn='\[\033[01;32m\]' # Green
ylw='\[\033[01;33m\]' # Yellow
blu='\[\033[01;34m\]' # Blue
pur='\[\033[01;35m\]' # Purple
cyn='\[\033[01;36m\]' # Cyan
wht='\[\033[01;37m\]' # White
clr='\[\033[00m\]'    # Reset

export PATH="$PATH:$HOME/.local/bin/"

# Prompt
PS1=${blu}'\n\w'${ylw}' $(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [[ -n $branch ]] && echo "\[${PROMPT_COLORS[2]}\](\[${PROMPT_COLORS[3]}\]git:$branch\[${PROMPT_COLORS[2]}\]) ") '${clr}
PS1+=${grn}'\n  '${clr}

# Aliases
[[ -f ~/.config/shell/aliases ]] && source ~/.config/shell/aliases

# History
HISTCONTROL=ignoredups
HISTSIZE=100000
HISTFILESIZE=$HISTSIZE
HISTFILE='$HOME/.cache/.bash_history'

shopt -s histappend

# Path
PATH="PATH:$HOME/.local/bin"
