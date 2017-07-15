#!/bin/bash

brew update
brew install pyenv pyenv-virtualenv

# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-virtualenv
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"'
exec $SHELL
pyenv install 3.6.1


