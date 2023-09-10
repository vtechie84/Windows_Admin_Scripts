# Format all System Drives

Get-Volume | Select -Property DriveLetter,Drivetype | Where-Object {$_.DriveLetter -ne 0 -and $_.DriveLetter -ne "c" -and $_.DriveType -eq "Fixed"} | select DriveLetter | FT -hidetableheader >c:\temp\disk.txt
$a=get-content 'c:\windows\temp\disk.txt'
foreach ($i in $a){ 
 Format-Volume $i
 }
