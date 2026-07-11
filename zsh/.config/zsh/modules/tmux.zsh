
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t mySession || tmux new -s mySession
fi
