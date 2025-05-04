@echo off
cls
setlocal EnableDelayedExpansion
set "workDir=C:\Users\%username%\Documents\ReallySlickScreensavers-0.2"

::----------start of main----------::
::Read the %random%, two times isn't a mistake! Why? Ask Bill.
::In fact at the first time %random% is nearly the same.
set /a "rdm=%random%"
set /a "rdm=%random%"
::Push to your path.
pushd "%workDir%"
::Count all files in your path. (dir with /b shows only the filenames)
set /a "counter=0"
for /f "delims=" %%i in ('dir /b ^|find ".scr"') do call :sub1
::This function gives a value from 1 to upper bound of files
set /a "rdNum=(%rdm%*%counter%/32767)+1"
::Start a random file
set /a "counter=0"
for /f "delims=" %%i in ('dir /b ^|find ".scr"') do set "fileName=%%i" &call :sub2
::Pop back from your path.
popd "%workDir%"
goto :eof
::----------end of main----------::

::----------start of sub1----------::
:sub1
::For each found file set counter + 1.
set /a "counter+=1"
goto :eof
::----------end of sub1----------::

::----------start of sub2----------::
:sub2
::1st: count again,
::2nd: if counted number equals random number then start the file.
set /a "counter+=1"
if %counter%==%rdNum% (

:getInput
call :Inputbox "Do you want to lock the system when %fileName:~0,-4% screen saver exits?" "Lock System?" "Y"

:: Check if cancel clicked
IF [!Input!] == [] exit /b

:: Check if input is "y" or "n"
echo !Input!|findstr /r "[^ynYN]" > nul
if errorlevel 1 (
goto runSS
) else (
set Input=
rem msg * /TIME:2 "Must be \"Y\" or \"N\""
call popup.vbs
goto getInput
)

:runSS
if /I "!Input!" EQU "y" (
start /w "" %fileName% /s&rundll32.exe user32.dll, LockWorkStation
) else (
start "" %fileName% /s
)

)
goto :eof
::----------end of sub2----------::

:InputBox
:: Create the inputbox
set input=
set default=%~3
set heading=%~2
set message=%~1
echo wscript.echo inputbox(WScript.Arguments(0),WScript.Arguments(1),WScript.Arguments(2)) >"%temp%\input.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%temp%\input.vbs" "%message%" "%heading%" "%default%"') do set input=%%a
exit /b