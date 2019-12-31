test -f ~/.bashrc && . ~/.bashrc

[[ -d $HOME/.bin ]] && export PATH="$PATH:$HOME/.bin"
[[ -d $HOME/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"

# brew
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# ruby
if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# n
if hash n 2> /dev/null; then
    export N_PREFIX="$HOME/.n"
    export PATH+=":$N_PREFIX/bin"
fi

# go
if hash go 2> /dev/null; then
  export GOPATH=~/.go
  export PATH=`go env GOPATH`/bin:$PATH
fi

export LC_TIME=C
