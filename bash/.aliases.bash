# Author: Ming Luo
# Description: bash aliases sourced by .bashrc

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git
alias gst='git status'
alias gcm='git commit'
alias gco='git checkout'
alias gbr='git branch -v'
alias grt='git remote -v'
alias gd='git diff'

# Python
alias python='python3'
alias pip='pip3.4'

# Tmux workaround for Vim/Tmux coloring collision problem
alias tmux='tmux -2'

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
