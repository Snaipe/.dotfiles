# aliases

alias sudo="sudo -E "

alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias lla="ll -a"
alias l="ls"
alias grep="grep -E --color=auto"
alias gdb="gdb -q"
alias how="howdoi"
alias dmesg="dmesg -H -Lalways"

if command -v dcfldd >/dev/null 2>&1; then
    alias dd="dcfldd"
fi

alias pymake="python setup.py"

alias netswitch="sudo netctl-auto switch-to"
alias netreload="sudo systemctl restart 'netctl-auto@*'"
alias netlist="netctl-auto list"

alias pingg="ping google.com"
alias pingd="ping 8.8.8.8"
alias ixio="curl -F 'f:1=<-' ix.io"

alias fixsteam='find ~/.local/share/Steam/ \( -name "*libgcc_s.so*" -o -name "*libstdc++.so*" -o -name "*libxcb.so*" -o -name "*libgpg-error.so*" \) -print -delete'

function dup() {
    { nohup termite -d $(pwd) >/dev/null 2>&1 & disown %- } >/dev/null 2>&1
}

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."
alias -g .......="../../../../../.."
alias -g ........="../../../../../../.."
alias -g .........="../../../../../../../.."
alias -g ..........="../../../../../../../../.."

function faketty() {
	script -qefc "$(printf "%q " "$@")" /dev/null
}

function ncproxy() {
    mknod backpipe p
    nohup nc -l -p $1 < backpipe | tee -a in | nc localhost $2 | tee -a ${3:-out.html} > backpipe &
    rm backpipe
}

function try() {
    times=$1; shift
    for i in $(seq 1 $times); do
        (eval "$@") || break;
    done
}

function iosplit() {
	local fd=""
	local arg="$1"
	while shift 1 >/dev/null 2>&1; do
		if [ "$arg" = "-" ]; then
			arg="/dev/stdout"
		fi
		fd="$fd >$arg"
		arg="$1"
	done
	echo $fd
	if [ -n $fd ]; then
		eval "cat$fd"
	fi
}
