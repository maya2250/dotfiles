test -f ~/.bashrc && . ~/.bashrc

export LSCOLORS=gxfxcxdxbxegedabagacad

[[ -d $HOME/.bin ]] && export PATH="$PATH:$HOME/.bin"

# ruby
if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# phoenix
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# aws
if [ -f ~/.aws/credentials ]; then export AWS_ACCESS_KEY_ID=$(grep aws_access ~/.aws/credentials | cut -d" " -f 3); fi
if [ -f ~/.aws/credentials ]; then export AWS_SECRET_ACCESS_KEY=$(grep aws_secret ~/.aws/credentials | cut -d" " -f 3); fi
hash aws_completer 2> /dev/null && complete -C `which aws_completer` aws

export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if hash go 2> /dev/null; then
  export GOPATH=~/.go
  export PATH=`go env GOPATH`/bin:$PATH
fi

test -d ~/.local/bin && export PATH=~/.local/bin:$PATH
