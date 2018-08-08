# Author: Ming Luo
# Description: zsh run commands to customize terminal experience

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## history
setopt APPEND_HISTORY
# append to the history file, don't overwrite it
setopt histappend
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000000

# Customizations to Path
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
export EDITOR='vim'

#colors
export TERM=screen-256color

# Aliases file
source ~/.aliases.zsh

# Git
fpath=(~/.zsh $fpath)
