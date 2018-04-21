export LSCOLORS=gxfxcxdxbxegedabagacad

# Add `~/bin` to the `$PAHT`
export PATH="$PATH:$HOME/bin"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

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

# venv
export VIRTUAL_ENV_DISABLE_PROMPT="TRUE"
DEFAULT_DIR=${HOME}/.dotfiles/default
if [ ! -d ${DEFAULT_DIR} ] && type python3 &>/dev/null; then
    python3 -m venv ${DEFAULT_DIR}
fi
source ${DEFAULT_DIR}/bin/activate

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# aws credential
export AWS_ACCESS_KEY_ID=$(grep aws_access ~/.aws/credentials | cut -d" " -f 3)
export AWS_SECRET_ACCESS_KEY=$(grep aws_secret ~/.aws/credentials | cut -d" " -f 3)

test -f ~/.bashrc && . ~/.bashrc
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
