autoload -U compinit compaudit
(
    setopt +o nomatch
    rm -f "$ZDOTDIR"/.zcompdump*
)
compinit

# Configure completion cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/.zsh/compcache"

# Complete file paths everywhere
zstyle ':completion:*' completer _complete _ignored _files

# Alias ~.<dir> as $XDG_CONFIG_HOME/<dir>
zstyle ':completion:*:*:-tilde-' completer _dot _users

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
