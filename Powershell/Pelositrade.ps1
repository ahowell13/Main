
# nancy pelosi trade tracker



$dataURI = 'https://house-stock-watcher-data.s3-us-west-2.amazonaws.com/data/all_transactions.json'

# Get and clean data

Function Get-NancyData {

    # hard coded latest transaction

    $latesttransaction = "2021-07-23"

    #get and parse data
    
    $rawdata = Invoke-RestMethod -Uri $dataURI -Method GET

    $nancy = $rawdata | Where-Object { $_.representative -eq "Hon. Nancy Pelosi" } | Sort-Object transaction_date

    $nancycurrent = $nancy[-1]

    if ( $nancycurrent.transaction_date -ne $latesttransaction ) {

        New-Item -Name "NEW_PELOSI_TRADE.TXT" -Path C:\Users\austi\Desktop\
        $nancycurrent | Out-File -FilePath "C:\Users\austi\Desktop\NEW_PELOSI_TRADE.txt"
    }
}

Get-NancyData

