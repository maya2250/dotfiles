# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] && hash tmux 2> /dev/null; then
    tmux attach || exec tmux
fi

# alias
case `uname --kernel-name` in
    Linux)
        alias ls='ls --color -F'
        alias ll='ls --color -alF'
        alias la='ls --color -A'
        alias pbcopy="xsel --clipboard --input"
        ;;
    Darwin)
        alias ls='ls -FG'
        alias la='ls -aFG'
        alias ll='ls -alFG'
        ;;
esac

alias be="bundle exec"
alias g="git"
alias globalip="curl inet-ip.info"

function path { echo $PATH | tr : '\n'; }

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

# ref: https://github.com/scop/bash-completion#installation
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if hash aws_completer 2> /dev/null; then
    complete -C aws_completer aws
fi

# color
COLOREND="\[\e[00m\]"
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"

# get current branch
function parse_git_branch() {
    branch="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/')"
    if [[ $branch != "" ]]; then
        if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]]; then
            echo "${GREEN}$branch${COLOREND}"
        else
            echo "${RED}$branch${COLOREND}"
        fi
    fi
}

function exit_status() {
    if [[ "$?" -eq 0 ]]; then
        echo "${WHITE}›${COLOREND}"
    else
        echo "$? ${RED}›${COLOREND}"
    fi
}

function promps() {
    tail="${WHITE}$(exit_status)${COLOREND}"
    PS1="${YELLOW}\w${COLOREND}$(parse_git_branch) ${tail} "
}

export PROMPT_COMMAND="promps; $PROMPT_COMMAND"
