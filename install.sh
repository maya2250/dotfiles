#!/bin/bash

DOT_FILES=$(ls -ad .??*)
DOT_DIR=~/.dotfiles

for file in ${DOT_FILES}; do
    echo ${file}
    ln -sf ${DOT_DIR}/${file} ~/
done
