# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias urxvt='urxvt -mod mod4'
alias sudo='A=`alias` sudo  '
alias ssh="TERM=linux ssh"
alias open='xdg-open'
alias grep='grep --color=auto'
alias fuck='sudo $(fc -ln -1)'
alias gdb="gdb -q"
alias kreboot='sudo kexec -l /boot/vmlinuz-linux --initrd=/boot/initramfs-linux.img --reuse-cmdline; sudo kexec -e'

#alias irssi-remote='ssh -R 19999:localhost:22 root@rincewind.gscomputerclub.com'
#alias i3lock='i3lock -c 000000'

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m[\]\[\e[0;37m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;32m]\]\[\e[0;37m\]\$ \[\e[m\]\[\e[0;32m\]'

# deprecated junk
#function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
#export PS1='<`EXT_COLOR 187`\u@\h`EXT_COLOR 174` \w \$\[\033[00m\>] '
# zenburnt
#export PS1='<\[\033[38;5;187m\]\u@\h\[\033[38;5;174m\] \w \$\[\033[00m\]> '

export PS1='\[\e[1;31m\]\u\[\e[m\]\[\e[1;34m\]@\[\e[m\]\[\e[1;36m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;31m\]\$ \[\e[m\]\[\e[0;00m\]'
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
export EDITOR='vim'
export PATH="~/bin/:$PATH"

unset SSH_ASKPASS

eval `dircolors -b`
