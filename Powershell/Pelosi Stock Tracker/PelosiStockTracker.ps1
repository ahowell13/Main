<#

Author: Austin Howell
Date: 12/13/2021 

This simple script will output a text file on your desktop if Nancy Pelosi has a new stock trade. 

Note you need to manually keep the latest transaction updated. Recommended this be run as a job.

#>


$loggedonuser = $env:USERNAME
$dataURI = 'https://house-stock-watcher-data.s3-us-west-2.amazonaws.com/data/all_transactions.json'

# Get and clean data

Function Get-NancyData {

    # hard coded latest transaction

    $latesttransaction = "2021-12-22"

    #get and parse data
    
    $rawdata = Invoke-RestMethod -Uri $dataURI -Method GET

    $nancy = $rawdata | Where-Object { $_.representative -eq "Hon. Nancy Pelosi" } | Sort-Object transaction_date

    $nancycurrent = $nancy[-1]

    if ( $nancycurrent.transaction_date -ne $latesttransaction ) {

        New-Item -Name "NEW_PELOSI_TRADE.TXT" -Path "C:\Users\$loggedonuser\Desktop\"
        $nancycurrent | Out-File -FilePath "C:\Users\$loggedonuser\Desktop\NEW_PELOSI_TRADE.txt"
    }
}

Get-NancyData

