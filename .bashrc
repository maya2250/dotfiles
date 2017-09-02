# alias
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -alFG'
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias path="echo $PATH | tr : '\n'"
alias ocaml="rlwrap ocaml"
alias mac_sleep="osascript -e 'tell application \"Finder\" to sleep'"

# color
GREEN="\[\e[1;32m\]"
BLUE="\[\e[1;34m\]"
RED="\[\e[1;31m\]"
YELLOW="\[\e[1;33m\]"
COLOREND="\[\e[00m\]"

# get current branch
function parse_git_branch() {
    branch="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/')"
    if [[ $branch != "" ]]; then
        if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]]; then
            echo "${GREEN}$branch${COLOREND} "
        else
            echo "${RED}$branch${COLOREND} "
        fi
    fi
}

function promps() {
    tail="${BLUE}›${COLOREND} "
    PS1="${YELLOW}\w ${COLOREND}$(parse_git_branch)${tail}"
}

PROMPT_COMMAND="promps; $PROMPT_COMMAND"
