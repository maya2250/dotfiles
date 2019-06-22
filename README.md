[![CircleCI](https://circleci.com/gh/maya2250/dotfiles/tree/master.svg?style=shield&circle-token=83a04a3161bc137bee356c036a74b8fa43dfd195)](https://circleci.com/gh/maya2250/dotfiles/tree/master)

# dotfiles

## Dotfiles install

First, clone repository.

`git clone https://github.com/maya2250/dotfiles.git`

Finally, execute `install.sh`.
Then, create symbolic link from ./dotfiles/.* to ~/.

`./dotfiles/install.sh`

## (option) To install linuxbrew and brew packages

Execute `install_brew`, and you can install linuxbrew and packages described `brewlist.txt`

`./install_brew`

## (option) ubuntu setup

Install script for ubuntu 19.04 is placed to `./dotfils/ubuntu/`.

Refer to `.circleci/config.yml` for usage.

## Install manually for myself
- github ssh key setup.
  1. https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
  1. https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account
