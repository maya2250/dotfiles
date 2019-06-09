test -f ~/.bashrc && . ~/.bashrc

[[ -d $HOME/.bin ]] && export PATH="$PATH:$HOME/.bin"

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
