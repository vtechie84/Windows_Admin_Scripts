# Query shared folders using WMI. Useful in older version of Windows were Powershell SMB module is unsupported.

$query = "SELECT * FROM Win32_Share"
$sharedFolders = Get-WmiObject -Query $query | Select-Object Name, Path

# Export the list of shared folders to a CSV file
$sharedFolders | Export-Csv -Path "C:\temp\Output.csv" -NoTypeInformation
