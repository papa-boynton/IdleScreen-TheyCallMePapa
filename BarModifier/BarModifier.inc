[Variables]

[IdleScreen-TheyCallMePapa.Style]
ImageAlpha=(#TopBarTitleOpacity#*#IdleScreen___App_Visibility#)
W=((((#TopHeight#+#TopBarIconHOffset#)*1.5)-((#TopHeight#+#TopBarIconHOffset#)*1.5)%1)*#IdleScreen___App_Visibility#)

[IdleScreen-TheyCallMePapa]
Meter=Image
MeterStyle=InfoStyle | CustomAppModifierStyle
SolidColor=0,0,0,0
MouseOverAction=[!Delay 10][!CommandMeasure MeasureActionTimer "Stop 3"]
