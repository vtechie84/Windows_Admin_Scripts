$DNSReport = 
foreach($record in Get-DnsServerZone -ComputerName "DNSServer"){
    $DNSInfo = Get-DnsServerResourceRecord -ComputerName "DNSServer" $record.zoneName
    
    foreach($info in $DNSInfo){
        [pscustomobject]@{
            ZoneName   = $record.zoneName
            HostName   = $info.hostname
            TimeStamp  = $info.timestamp
            RecordType = $info.recordtype
            RecordData = if($info.RecordData.IPv4Address){
                             $info.RecordData.IPv4Address.IPAddressToString}
                         else{
                             try{$info.RecordData.NameServer.ToUpper()}catch{}
                         }
        }
    }
}

$DNSReport | Export-Csv "C:\Temp\DNSRecords.csv" -NoTypeInformation
