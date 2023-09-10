$ACL_Imp = import-csv E:\test.csv         # Path to CSV file

   foreach($Item in $ACL_Imp){
   
       $Folder = $Item.FolderName
       $Acl = Get-Acl $Folder
       $GroupName = @($Item.'Groups')
       $Permission= @($Item.Permissions)
       $Inherit = @($item.Inherited)
       $AclRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$GroupName","$Permission","Allow") 
       $Acl.SetAccessRule($AclRule)
       $Acl | Set-Acl $Folder
} 
