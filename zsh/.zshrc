# Path to your oh-my-zsh installation.
# TODO - clean this up
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="eastwood"
#ZSH_THEME="norm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode colorize colored-man)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export PATH=$HOME/bin:$HOME/tools:/usr/local/bin:$PATH
export EDITOR='vim'
export COUNTRY='US'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

unset SSH_ASKPASS

#alias ssh="TERM=linux ssh"
alias kexec-auto='kexec -l /boot/efi/EFI/arch/vmlinuz-linux.efi --initrd=/boot/efi/EFI/arch/initramfs-linux.img --reuse-cmdline'
alias ls='ls --color=auto -F'
alias open='xdg-open 1> /dev/null 2> /dev/null'
alias sudo="sudo -E "
alias grep='grep --color=auto'
alias objdump='objdump -M intel'


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

bindkey "^R" history-incremental-search-backward
