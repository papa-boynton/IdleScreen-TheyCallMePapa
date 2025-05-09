[Variables]
; -------------------------------------------------------------------------------
; VariablesDefault.inc should be a copy of Variables.inc, but contain all of the 'default' settings when the app is first installed.
; Any settings changed by the user should be written to Variables.inc, not VariablesDefault.inc.
; VariablesDefault.inc and Variables.inc should contain all of the user-configurable options for your app.
; -------------------------------------------------------------------------------

; -------------------------------------------------------------------------------
; Below variables are required for the app's function. Do not remove or change.
; -------------------------------------------------------------------------------

MyAppID=IdleScreen-TheyCallMePapa
MyAppName=IdleScreen
MyAppAuthor=TheyCallMePapa
MyAppGUID=92c0d78d-21f7-4cac-9764-1cce63584e19
MyVariablesLoc=#SKINSPATH#Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\Variables\Variables.inc
MyAppIsWebView=0

; -------------------------------------------------------------------------------
; Add your variables below: 
; -------------------------------------------------------------------------------
; Custom App Button Visibility
IdleScreen___App_Visibility=1

;Main settings menu
CustomSetting3=1
CustomSetting4=1
CustomSetting5=1

CustomCheckmark=1

;Settings submenu 1
CustomSetting1.1=1
CustomSetting2.1=0
CustomSetting3.1=1

;Settings submenu 2
CustomSetting1.2=0
CustomSetting2.2=1
CustomSetting3.2=0

InputValue2=Input Value 2

Version=1.1
; -------------- Change these values to cover all your monitors -------------- ;
WindowX=0
WindowY=0
WindowW=1920
WindowH=1080
; --------------------------------- Settings --------------------------------- ;
TimeOut=10m
; Duration till screensaver shows up (Example: 45s, 3m, 1h)
IgnoreIdleDuration=0
; Should the above setting be ignored, and launch screensaver only with hotkey
LoadedNotif=1
; Should Idlewebview show a notification when loaded
FullScreenCheck=1
; Should Idlewebview pause if the active window is fullscreen
Location=1
; Monitor index of screensaver
Background=18,18,18,185
; rgba, opacity 0-255. This is the base color and is independent from your HTML file
Blur=Acrylic
; Background blur using Window's blurring technique (None, Blur, Acrylic)
Lockit=0
; Lock PC after screensaver quits
Filename=
; Name of current Screensaver
