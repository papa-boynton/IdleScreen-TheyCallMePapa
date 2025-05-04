# In this script file, you need to define function Update with no parameter.
# Update function is called every time skin updating and whatever it returning will be this measure value.
$Global:a = 1

function Update
{
    $Global:a = $Global:a + 1
    return $Global:a
}

# Define the folder containing screensavers
$screensaverFolder = "C:\Users\$env:username\Documents\Rainmeter\Skins\Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\ScreenSavers"

# Get all screensaver files (executable files)
$screensavers = Get-ChildItem -Path $screensaverFolder -Filter "*.scr"

# Get a random screensaver
$randomScreensaver = $screensavers | Get-Random

# Start the random screensaver
Start-Process -FilePath $randomScreensaver.FullName -Wait -NoNewWindow -ArgumentList "/s"

# Wait for user interaction to end screensaver (e.g., mouse movement)
Start-Job -ScriptBlock { while ($true) { Start-Sleep -Seconds 1 } }

# Lock the PC after screensaver timeout (adjust timeout as needed)
Start-Sleep -Seconds 10  # Replace 60 with desired wait time in seconds

# Stop the waiting job
Stop-Job

# Optional: Log script execution
# Write-Host "Screensaver started and PC locked."
