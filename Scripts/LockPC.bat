@echo off
cls
setlocal EnableDelayedExpansion
Echo Filename is "!filename!"

:LOOP
TASKLIST /FI !filename! >nul 2>&1
rem TASKLIST /FI %filename%
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  ECHO !filename! is still running
  TIMEOUT /T 5
  GOTO LOOP
)

:CONTINUE
pause
rundll32.exe user32.dll, LockWorkStation