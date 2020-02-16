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
alias grep="grep --color"
alias k="kubectl"
complete -F __start_kubectl k

function path { echo $PATH | tr : '\n'; }

# ref: https://github.com/scop/bash-completion#installation
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

[[ -f /usr/share/sounds/GNUstep/Tink.wav ]] && notify() { paplay /usr/share/sounds/GNUstep/Tink.wav; }

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

export PROMPT_COMMAND="promps; $PROMPT_COMMAND"
