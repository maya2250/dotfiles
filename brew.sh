#!/bin/bash

# move to directory existing this shell-script
cd $(dirname $0)

# store packages to variable
brew_list=$(cat "brewlist.txt")
brew_cask_list=$(cat "brewcasklist.txt")

# install packages
for package in ${brew_list[@]}; do
    brew install ${package}
done

for package in ${brew_cask_list[@]}; do
    brew cask install ${package}
done

# delete variables
unset brew_list brew_cask_list package
