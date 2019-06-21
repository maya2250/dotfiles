#!/usr/bin/env bash

# move to directory existing this shell-script
cd $(dirname $0)

# store packages to variable
brew_list=$(cat "brewlist.txt")

# install packages
for package in ${brew_list[@]}; do
    brew install ${package}
done
