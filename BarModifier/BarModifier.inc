
[IdleScreen-TheyCallMePapa.Style]
W=((((#TopHeight#+#TopBarIconHOffset#)*1.5))-((((#TopHeight#+#TopBarIconHOffset#)*1.5)%1)))
[IdleScreen-TheyCallMePapa]
Meter=Image
MeterStyle=InfoStyle | CustomAppModifierStyle
SolidColor=0,0,0,0
LeftMouseDownAction=[]
MouseOverAction=[!Delay 10][!CommandMeasure MeasureActionTimer "Stop 3"]
