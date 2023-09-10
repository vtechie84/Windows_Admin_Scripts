# Remove all User Profile

$Result= Get-CimInstance -Class Win32_UserProfile | Where-Object {$_.Loaded -eq $False -and $_.Special -ne 'Special'-and $_.LocalPath -ne "C:\Users\Administrator" -and $_.LocalPath -ne "C:\Users\Public"} 
foreach ($Temp in $Result){
   $Temp | Remove-CimInstance
 }
