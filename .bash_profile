export LSCOLORS=gxfxcxdxbxegedabagacad

# Add `~/bin` to the `$PAHT`
export PATH="$PATH:$HOME/bin"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# phoenix
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH

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

# load .bashrc
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

test -f ~/.bashrc && . ~/.bashrc
