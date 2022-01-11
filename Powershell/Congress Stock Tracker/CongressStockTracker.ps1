<#

Author: Austin Howell
Date: 12/13/2021 
Last updated: 01/11/2022

This simple script will output a text file on your desktop if a Congress person of your choice has a new stock trade. 
This only works on windows machines for now.
Change the representative variable to match your congress person. 
You need to manually keep the latest transaction updated. Recommended this be run as a job.

#>

$latesttransaction = "2021-07-13"
$Representative = "Hon. Nancy Pelosi"
$loggedonuser = $env:USERNAME
$dataURI = 'https://house-stock-watcher-data.s3-us-west-2.amazonaws.com/data/all_transactions.json'

# Get and clean data

Function Get-CongressData {

    # Get and parse data
    
    $rawdata = Invoke-RestMethod -Uri $dataURI -Method GET

    $congress_data = $rawdata | Where-Object { $_.representative -eq $Representative } | Sort-Object transaction_date

    $target_stock = $congress_data[-1]

    # Check for new transaction

    if ( $target_stock.transaction_date -ne $latesttransaction ) {

        # Get previous stock object and the total array length

        $Index_stock = ($congress_data | Where-Object { $_.transaction_date -eq $latesttransaction })[0]
        $array_length = $congress_data.length

        # Get Index of previous stock object

        $Index_location = [array]::IndexOf($congress_data, $Index_stock)

        # Get all transactions after previous stock target

        $new_stock_purchases = $congress_data[$Index_location..$array_length]

        # Make file containing new trade info

        $new_stock_purchases | Out-File -FilePath "C:\Users\$loggedonuser\Desktop\NEW_CONGRESS_TRADE.txt" -Force

        return "New trade detected. Details output to desktop txt file."
    }

    else {

        return "No new stock purchases since target date."
    }
}



Get-CongressData

