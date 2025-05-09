[Rainmeter]

[Variables]

;----------------------------------------------------
; # # ADD BACKGROUND PROCESSES BELOW # # # # # # # #
; # # Measures that run even when the app isn't open
;----------------------------------------------------

;----------------------------------------------------------------------
; Example # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
; Updates the top bar when CPU temperature changes
; 
; UpdateDivider=10 rechecks the temperature every 10 seconds
; Recommended this number be no lower than 10 to prevent high CPU usage
;----------------------------------------------------------------------

IdleScreen___Auxiliar_Application_State=(#IdleScreen___Info_Style#=0?#HideProgramsApp#:(#IdleScreen___Info_App_1#=2?0:#HideProgramsApp#))

[Func]
Measure=Script
ScriptFile=#SKINSPATH#Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\Scripts\MyFunc.lua
DynamicVariables=1
UpdateDivider=(#IgnoreIdleDuration# = 1 ? -1 : 1)
;Disabled=[#HideApp[#CURRENTSECTION]]

[mToggle]
Measure=Calc
Formula=1 - mToggle 
IfCondition=mToggle = 0
; IfTrueAction=[!CommandMeasure CoreBridge "start('', 'IdleWebview toggled off', 'Idle timer is now paused and will remain until toggled', '', '1000')"]
IfCondition2=mToggle = 1 && #LoadedNotif# = 1
; IfTrueAction2=[!CommandMeasure CoreBridge "start('', 'IdleWebview is active', 'IdleWebview will show up after #TimeOut# of idle time', '', '1000')"]
IfConditionMode=1
DynamicVariables=1
UpdateDivider=-1

[mForce]
Measure=Calc
OnUpdateAction=[!CommandMeasure Func "Force()"]
Disabled=1
UpdateDivider=-1
Group=NUOL

[Idletime]
Measure=SysInfo
SysInfoType=IDLE_TIME

[IsFullScreen]
Measure=Plugin
Plugin=IsFullScreen
Disabled=(1-#FullScreenCheck#)
OnChangeAction=[!CommandMeasure Func "CheckPause()"]
