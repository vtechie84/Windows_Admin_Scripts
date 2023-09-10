$FolderPath = dir "d:\" -Directory -Recurse
$Output = @()
ForEach ($Folder in $FolderPath) {
      
      if ($Folder.FullName -notlike '*$RECYCLE.BIN*'){

         if ($Folder.FullName -notlike '*System Volume Information*'){

    $Acl = Get-Acl -Path $Folder.FullName

    ForEach ($Access in $Acl.Access) {

             
$Properties = [ordered]@{'Folder Name'=$Folder.FullName;'Groups'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'InHeritFlag'=$Access.InheritanceFlags ;'Inherited'=$Access.IsInherited}
$Output += New-Object -TypeName PSObject -Property $Properties  
$Output | Export-CSV D:\ACL_G_Drive_29032023.CSV -NoTypeInformation -Append          
      }
    }
  }
}
