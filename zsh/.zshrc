# Author: Ming Luo
# Description: zsh run commands to customize terminal experience

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
setopt histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
setopt -s checkwinsize

# Customizations to Path
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export GOROOT=$HOME/goroot
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
export EDITOR='vim'

# Handle Tmux/Vim environment collision problem
if [[ $COLORTERM == "gnome-terminal" ]]; then
    export TERM="xterm-256color"
fi

# Aliases file
source ~/.aliases.zsh

# Git
fpath=(~/.zsh $fpath)

# Color
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u\[\033[00m\]@\[\033[01;31m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  PS1='\[\033[01;34m\]\w\[\033[00m\]\> '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  PS1='\w\> '
fi
unset color_prompt force_color_prompt
