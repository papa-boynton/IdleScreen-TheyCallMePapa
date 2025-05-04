# In this script file, you need to define function Update with no parameter.
# Update function is called every time skin updating and whatever it returning will be this measure value.
$Global:a = 1

function Update
{
    $Global:a = $Global:a + 1
    return $Global:a
}

# Setup some variables
$ScreenSaversPath = $RmAPI.OptionStr('ScreenSaversPath')
#$ScreenSaversPath = "C:\Users\$env:username\Documents\Rainmeter\Skins\Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\ScreenSavers"
# $folderPath = "C:\Users\$env:username\Documents\Rainmeter\Skins\Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\ScreenSavers"
$folderPath = $ScreenSaversPath
#$VarsLocation = $RmAPI.VariableStr('MyVariablesLoc')
$Lockit = $RmAPI.Variable('Lockit')
#Lockit = 1

# Select random screensaver
$screensavers = Get-ChildItem -Path $folderPath -Filter "*.scr" -File
$randomScreensaver = $screensavers | Get-Random

# Load the random screensaver
Start-Process -FilePath $randomScreensaver.FullName -ArgumentList "/s"

# Wait for the screensaver process to exit
#$process = Get-Process -Name $randomScreensaver
#$process.WaitForExit()



# Lock the computer
If ($Lockit -eq  1)    
{
rundll32.exe user32.dll,LockWorkStation
}
