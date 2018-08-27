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

# notify when a task is done
alias nd='terminal-notifier -title "Terminal" -message "Done with task!"; say finished task; tput bel'

# Git
alias gst='git status'
alias gcm='git commit'
alias gco='git checkout'
alias gbr='git branch -v -v'
alias grt='git remote -v'
alias gd='git diff'

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

# Fix last commit with current changes, push to remote
gitwhoops () {
    preface="[gitwhoops] "
    echo ""
    echo "${preface}git status"
    git status
    echo ""
    echo "${preface}git add -A"
    git add -A
    echo ""
    echo "${preface}git commit -a --amend --no-edit"
    git commit -a --amend --no-edit
    echo ""
    echo "${preface}git push --f"
    git push -f
    echo ""
    echo "${preface}git status"
    git status
}
