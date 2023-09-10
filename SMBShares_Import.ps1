# Create new SMB shares from CSV file

$Import = import-csv C:\Temp\SMB.csv

ForEach($Item in $Import){

  $Name = $Item.Name
  $path = $Item.Path

  New-SmbShare -Name $Name -Path $path

  
}
