#!/bin/bash

cd $(dirname $0)
DOT_FILES=$(ls -ad .?*)

for file in ${DOT_FILES}; do
    if [ ${file} = '.git' ] || [ ${file} = '.gitignore' ] || [ ${file} = '..' ]; then
	continue
    fi

    ln -sf ${PWD}/${file} $HOME
done
unset DOT_FILES file
