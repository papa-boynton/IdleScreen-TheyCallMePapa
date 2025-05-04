cls
# Comment: Set the working directory
$workDir = "C:\Users\$env:username\Documents\Rainmeter\Skins\Idle\@Resources\ScreenSavers"
# Grab the value of the lockit variable and convert to poweshell variable
$Lockit = $RmAPI.VariableStr('Lockit')
# Push to your path.
Push-Location -Path $workDir
# Select a random screensaver and load it.
$files = Get-ChildItem -File | Where-Object { $_.Extension -eq ".scr" }
$FileName = $files | Get-Random -Count 1

Start-Process -FilePath $FileName -ArgumentList "/s"
$process = Get-Process -Name $Filename
Write-Host "$process started $(Get-Date -Format 'MM/dd/yyyy h:mm:ss tt')"
$process.WaitForExit()
Write-Host "$process ended $(Get-Date -Format 'MM/dd/yyyy h:mm:ss tt')"

# Pop back from your path.
Pop-Location
CD..
$path = (get-location).path
If ( $Lockit -eq 1 )
{
CD $path/Scripts
./LockPC.ps1
}
