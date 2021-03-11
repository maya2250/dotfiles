autoload -Uz compinit
compinit

setopt share_history
bindkey -e
bindkey '\ef' emacs-forward-word

autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

export CLICOLOR=1
export LSCOLORS=gxFxCxDxCxegedabagaceda

[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'
