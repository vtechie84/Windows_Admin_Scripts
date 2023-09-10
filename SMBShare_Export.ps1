Get-SmbShare | Select Name, Path

(Get-SmbShare | Get-SmbShareAccess) | export-csv C:\Temp\share_Export.csv -NoTypeInformation
