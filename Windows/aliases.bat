@echo off

:: Default Github path, change if different
SET GITHUB=%USERPROFILE%\Documents\Github
SET GDRIVE="%USERPROFILE%\Google Drive"

:: Make an alias for the current session only or check existing aliases if ran with no argument
DOSKEY alias=if ".$*." == ".." ( DOSKEY /MACROS ) else ( DOSKEY $* )
:: Edit the aliases.bat file
DOSKEY editalias=vim %GITHUB%\dotfiles\Windows\aliases.bat

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
DOSKEY github=cd %GITHUB%\$1
DOSKEY gdrive=cd %GDRIVE%\$1

:: Machine Specific aliases
DOSKEY scope=e:\ScopeSDK\Scope.exe $* -INPUT_PATH %CD%;e:\CosmosSamples\VCROOT -OUTPUT_PATH e:\CosmosSamples\VCROOT -workingRoot %TEMP%  -RESOURCE_PATH %CD%;e:\CosmosSamples\VCROOT

