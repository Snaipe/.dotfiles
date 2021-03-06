HISTFILE="$XDG_CACHE_HOME"/zsh/history
HISTSIZE=10000000
SAVEHIST=10000000

mkdir -p "$(dirname "$HISTFILE")"
touch "$HISTFILE"

setopt HIST_IGNORE_DUPS
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
