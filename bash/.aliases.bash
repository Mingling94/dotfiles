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

# Friendly find
# Something similar: https://github.com/sharkdp/fd
function ff() {
    if [[ "$1" == "-L" ]]; then
        follow_opt="-follow"
        shift
    fi

    if [[ $# -eq 0 ]]; then
        echo "Usage: $0 [-L] [SEARCH_PATH] EXPRESSION"
        return 1
    elif [[ $# -eq 1 ]]; then
        search_path=(".")
        expression="$1"
    else
        ## NOTE: this is zsh-specific
        search_path=${@[1,-2]}
        expression=${@[-1]}
    fi

    # Determine case-sensitivity based on whether input has capitals
    if (echo $expression | grep -q '[A-Z]'); then
        name_opt="-name"
    else
        name_opt="-iname"
    fi

    # Use the ${(q)foo} expansion to preserve escaping properly
    find_expr="find $search_path -type f $follow_opt $name_opt \*${(q)expression}\*"
    eval "$find_expr"
}
