$workDir = "C:\Users\$env:username\Documents\Rainmeter\Skins\Droptop Community Apps\Apps\IdleScreen-TheyCallMePapa\ScreenSavers"
$VarsLocation = $RmAPI.VariableStr('MyVariablesLoc')
Push-Location -Path $workDir
$files = Get-ChildItem -File | Where-Object { $_.Extension -eq ".scr" }
$FileName = $files | Get-Random -Count 1
$RmAPI.Bang('!SetVariable FileName "' + $FileName + '"')
$RmAPI.Bang('!WriteKeyValue Variables FileName "' + $FileName + '" "' + $VarsLocation + '"')
Start-Process -FilePath $FileName -ArgumentList "/s"
Pop-Location
$Lockit = $RmAPI.Variable('Lockit')
$FileName = $RmAPI.VariableStr('FileName')
Do {
If (!(Get-Process $FileName -ErrorAction SilentlyContinue)) {
#Write-Host "Waiting for Process to Start"
Start-Sleep -Seconds 2
}Else {
#Write-Host 'Process has Started'
While (Get-Process $FileName -ErrorAction SilentlyContinue) {
#Write-Host 'Waiting for Process to Stopped'
Start-Sleep -Seconds 2
}
#Write-Host 'Process Stopped' ; $Status = 'Done'
}
}Until ($Status)
CD..
$path = (get-location).path
If ( $Lockit -eq  1 )
{
CD $path/Scripts
./LockPC.ps1
}
