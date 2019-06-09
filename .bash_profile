test -f ~/.bashrc && . ~/.bashrc

[[ -d $HOME/.bin ]] && export PATH="$PATH:$HOME/.bin"

# ruby
if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# man
export MANPAGER='less -R'
man() {
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

# n
if hash n 2> /dev/null; then
    export N_PREFIX="$HOME/.n"
    export PATH+=":$N_PREFIX/bin"
fi

# go
if hash go 2> /dev/null; then
  export GOPATH=~/.go
  export PATH=`go env GOPATH`/bin:$PATH
fi
