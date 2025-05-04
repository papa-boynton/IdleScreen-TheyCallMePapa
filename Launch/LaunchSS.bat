@echo off
cls

setlocal EnableDelayedExpansion
set "workDir=C:\Users\%username%\Documents\Rainmeter\Skins\Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\ScreenSavers"

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
start "" %fileName% /s
)

:CheckTask
rem TASKLIST /FI "IMAGENAME eq %filename%" >nul 2>&1
TASKLIST /FI "IMAGENAME eq %filename%"
IF ERRORLEVEL 1 (
GOTO CONTINUE
) ELSE (
ECHO %filename% is still running
GOTO CheckTask
)


:CONTINUE
::set filename=
::set counter=
::set rdm=
::set rdNum=

rem rundll32.exe user32.dll, LockWorkStation