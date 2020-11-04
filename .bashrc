# If not running interactively, do not do anything
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] && hash tmux 2> /dev/null; then
    tmux attach -d || exec tmux
fi

# ref: https://github.com/scop/bash-completion#installation
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# shellcheck source=/dev/null
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

hash direnv 2> /dev/null && eval "$(direnv hook bash)"

function man() {
    env \
        LESS_TERMCAP_md=$'\e[38;5;70m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[48;5;238m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[4;38;5;130m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        man "$@"
}

COLOREND="\[\e[00m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
WHITE="\[\e[0;37m\]"

function __my_parse_git_branch() {
    branch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    test "${branch}" == "" && return 0

    if [[ -z "$(git status --short)" ]]; then
        echo "${GREEN} [${branch}]${COLOREND}"
    else
        echo "${RED} [${branch}]${COLOREND}"
    fi
}

function __my_exit_status() {
    if [[ "$?" -eq 0 ]]; then
        echo "${WHITE}›${COLOREND}"
    else
        echo "$? ${RED}›${COLOREND}"
    fi
}

function promps() {
    tail="${WHITE}$(__my_exit_status)${COLOREND}"
    PS1="${YELLOW}\w${COLOREND}$(__my_parse_git_branch) ${tail} "
}

export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%c '
shopt -s histappend

export PROMPT_COMMAND="history -a; history -c; history -r; promps; ${PROMPT_COMMAND}"
