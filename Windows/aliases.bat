@echo off

:: Make an alias for the current session only
:: Also check existing aliases if ran with no argument
DOSKEY alias=if ".$*." == ".." ( DOSKEY /MACROS ) else ( DOSKEY $* )
DOSKEY vimalias=vim C:\Users\miluo\Documents\Github\dotfiles\Windows\aliases.bat

:: Bash/Linux like aliases
DOSKEY ls=DIR $* 
DOSKEY cp=COPY $* 
DOSKEY xcp=XCOPY $*
DOSKEY mv=MOVE $* 
DOSKEY clear=CLS
DOSKEY h=DOSKEY /HISTORY

:: Vim like aliases
DOSKEY q=exit
DOSKEY :q=exit

:: Git & Dev
DOSKEY gst=git status $*
DOSKEY gcm=git commit $*
DOSKEY gco=git checkout $*
DOSKEY gbr=git branch -v $*
DOSKEY grt=git remote -v $*

:: Directory shortcuts
DOSKEY documents=cd C:\Users\miluo\Documents\$1
DOSKEY downloads=cd C:\Users\miluo\Downloads\$1
DOSKEY github=cd C:\Users\miluo\Documents\Github\$1
