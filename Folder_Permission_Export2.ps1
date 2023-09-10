#Simple script to export folder permissions

Get-Childitem -path "D:\" -recurse | Where-Object {$_.PSIsContainer} | Get-ACL| Select-Object Path -ExpandProperty Access | Export-CSV C:\Temp\Ntfs_Subfolders.csv
