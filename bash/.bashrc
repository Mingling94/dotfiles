# Author: Ming Luo
# Description: bash run commands to customize terminal experience

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Customizations to Path
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
export EDITOR='vim'

# Handle Tmux/Vim environment collision problem
if [[ $COLORTERM == "gnome-terminal" ]]; then
    export TERM="xterm-256color"
fi

# Aliases file
source ~/.aliases.bash

# Git
source ~/.gitcompletion.bash

# Color
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Random emoji per terminal line
source ~/Github/dotfiles/bash/emojis.bash
# TODO: Fix two space emojis and spacing in terminal
# OR
# TODO: Get rid of all two space emojis in emojis.bash
EMOJIS=(
"${SMILEYS[@]}"
"${PEOPLE[@]}"
"${CLOTHING[@]}"
"${ANIMALS[@]}"
"${FOOD[@]}"
"${SPORTS[@]}"
"${OBJECTS[@]}"
"${TRAVEL[@]}"
"${SYMBOLS[@]}"
)
RANDOM_EMOJI() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
}

# Change my Github username to **** Ming **** where * = some
# random emoji
E=$(RANDOM_EMOJI)
sed -i "" -e "s/name = .... Ming ..../name = ${E}${E}${E}${E} Ming ${E}${E}${E}${E}/g" ~/.gitconfig 

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
  # makes the terminal have pretty colors
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad
  PS1='$(RANDOM_EMOJI) \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '
else
  PS1='\w\> '
fi
unset color_prompt force_color_prompt

# For fun fact piped to cowsay piped to rainbow
# Only runs ~20% of the time
[ $[ $RANDOM % 5 ] == 0 ] && fortune -as | cowsay | lolcat

