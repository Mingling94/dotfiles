#!/bin/bash
# Script to download my must have github repos

# Install programs if needed

# Git
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
	sudo apt-get install git git-core bash-completion
	git config --global push.default simple
fi

# TODO: setup Go development environment http://golang.org/doc/install

# Install hub from source
github # alias from /dotfiles/bash/.bash_aliases to navigate to github folder
git clone git@github.com:github/hub.git
cd hub
# Assuming `~/bin` is in your PATH:
$ ./script/build -o ~/bin/hub
