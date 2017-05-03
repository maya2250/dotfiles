#!/bin/bash

# move to directory existing this shell-script
cd $(dirname $0)

# store packages to variable
brew_list=$(cat "brewlist.txt")
brew_cask_list=$(cat "brewcasklist.txt")

# install packages
brew install ${brew_list[@]}
brew cask install ${brew_cask_list[@]}

# delete variables
unset brew_list brew_cask_list
