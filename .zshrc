[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'

setopt share_history
bindkey -e
bindkey '\ef' emacs-forward-word
