@echo off

:: Default Github Folder, change if different
SET GITHUBFOLDER=%USERPROFILE%\Documents\Github

:: Make an alias for the current session only or check existing aliases if ran with no argument
DOSKEY alias=if ".$*." == ".." ( DOSKEY /MACROS ) else ( DOSKEY $* )
:: Edit the aliases.bat file
DOSKEY vimalias=vim %GITHUBFOLDER%\dotfiles\Windows\aliases.bat

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
DOSKEY documents=cd %USERPROFILE%\Documents\$1
DOSKEY downloads=cd %USERPROFILE%\Downloads\$1
DOSKEY github=cd %GITHUBFOLDER%\$1
