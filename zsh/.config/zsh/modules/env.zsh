
# -------------------- #
# Enviroment Variables #
# -------------------- #
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin"
export QML_XHR_ALLOW_FILE_READ=1

if command -v nvim &> /dev/null; then
  export EDITOR="nvim"
elif command -v vim &. /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nano"
fi
export MANPAGER='nvim +Man!'
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi
