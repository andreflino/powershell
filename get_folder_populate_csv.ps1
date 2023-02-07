#Simple Script to collect the folder's files name and save into csv

$DirectoriesFile = 'C:\Folders'
$CSV = 'C:\Temp\file.csv'


Add-Content -Path $CSV  -Value 'File name'

foreach($fileName in gci $DirectoriesFile){

    Add-Content -Path $CSV -Value $fileName

    }
