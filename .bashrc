# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]]; then
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

function promps() {
    tail="${WHITE}›${COLOREND}"
    PS1="${YELLOW}\w${COLOREND}$(parse_git_branch) ${tail} "
}

export PROMPT_COMMAND="promps; $PROMPT_COMMAND"
