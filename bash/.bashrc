# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Customizations to Path
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export GOROOT=$HOME/goroot
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
export EDITOR='vim'

# Python
alias python='python3'
alias pip='pip3.4'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    clias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git
source ~/git-completion.bash # This needs to be manually downloaded
source /etc/bash_completion.d/git-prompt
alias gst='git status'
alias gcm='git commit'
alias gco='git checkout'
alias gbr='git branch -v'
alias grt='git remote -v'
alias gd='git diff'

# Cuz remembering vim vs. bash is hard sometimes
alias :q='exit'
alias :Q='exit'
alias q='exit'
alias Q='exit'

# Poloniex lending bot start/stop scripts
alias startplb='~/Github/dotfiles/bin/start-poloniexlendingbot.sh'
alias stopplb='~/Github/dotfiles/bin/stop-poloniexlendingbot.sh'

# Go to github folder
github () {
	cd "/home/ming/Github/$1"
}

# For fun fact piped to cowsay piped to rainbow
# Only run ~20% of the time
[ $[ $RANDOM % 5 ] == 0 ] && fortune -as | cowsay | lolcat
