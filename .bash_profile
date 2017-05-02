export LSCOLORS=gxfxcxdxbxegedabagacad

# export home/bin
export PATH="$PATH:$HOME/bin"

# android
#export PATH=$PATH:/Users/shinya/Library/Android/sdk/platform-tools 

# go
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin

test -r ~/.bashrc && . ~/.bashrc

PS1="[\u@\h \w]\$ "

#export PATH="/usr/local/Cellar/git/2.11.0/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

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
