#SingleInstance Force
#NoTrayIcon

IniRead, OutputVar, ..\Variables.inc, Variables, Key
IniRead, OutputVar2, ..\Variables.inc, Variables, Key2
IniRead, RainmeterPath, Hotkeys.ini, Variables, RMPATH

Hotkey,%OutputVar%,PauseIdleWebview
Hotkey,%OutputVar2%,ShowIdleWebview

; JaxCore ValliStart compatability
Name = ValliStart.ahk
DetectHiddenWindows On
SetTitleMatchMode RegEx
IfWinExist, i)%Name%.* ahk_class AutoHotkey
{
    ValliScriptPath = % RegExReplace(a_scriptdir,"IdleWebview.*\\?$")"Vallistart\@Resources\Actions\Source code\Vallistart.ahk"
    ValliAhkPath = % RegExReplace(a_scriptdir,"IdleWebview.*\\?$")"Vallistart\@Resources\Actions\"
    Run, %ValliAhkPath%AHKv1.exe `"%ValliScriptPath%`", %ValliAhkPath%
}
Return

PauseIdleWebview:
    Run "%RainmeterPath% "!UpdateMeasure "mToggle" "Droptop Community Apps\\Apps\\IdleScreen-TheyCallMePapa\\BackgroundProcesses\\BackgroundProcesses.inc" "
Return

ShowIdleWebview:
    Run "%RainmeterPath% "!UpdateMeasure "mForce" "Droptop Community Apps\\Apps\\IdleScreen-TheyCallMePapa\\BackgroundProcesses\\BackgroundProcesses.inc" "
Return