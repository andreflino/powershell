##Get the machines from specific OU##
##To run it you need to have the RSA tool kit installed or run it from AD##

$OUpath = 'ou="OU NAME",ou="OU NAME",ou="OU NAME",dc="DOMAIN",DC="SUB_DOMAIN"'

$ExportPath = 'c:\temp\cvs_file_name.csv'

Get-ADComputer -Filter * -SearchBase $OUpath | Select-object DistinguishedName,DNSHostName,Name | Export-Csv -NoType $ExportPath




##Test ping coonection of the machines on the file "hostlist", if the machine is online, get the name of folder and output it
##To run it you need to execute PowerShell as specific domain user

$outputcsv = "C:\temp\pingstatus.csv"
$hostlist = Get-Content "C:\temp\hostlist.txt"
$OutputMessage = @()

foreach($comp in $hostlist){
    
    $pingtest = Test-Connection -ComputerName $comp -Quiet -Count 2 -ErrorAction SilentlyContinue

    if($pingtest) {

         $software_version = Get-ChildItem -Path \\$comp'\c$\Program Files\"SOFTWARE_YOU_WANT"' -Directory -ErrorAction SilentlyContinue      

         $date = Get-Date -Format "dddd MM/dd/yyyy HH:mm"
         $OutputMessage += "$comp,$software_version,$date"
           
      }
     else {
   
       $OutputMessage += "$comp,Offline"
          
     }
     
}

 $OutputMessage | Out-File $outputcsv -Encoding utf8 -Append
