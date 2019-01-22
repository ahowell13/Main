<# Recursive Directory Search Script

This script will take a search word or phrase and search every drive, including mapped drives, on the computer for the item.

Author: Austin Howell
Date: 1/20/2019

#>


function SearchScript {

	$SearchVariable = Read-Host -prompt "Input your search word or phrase."

	$SearchOutput = (Get-PSDrive -PSProvider Filesystem).root | ForEach-Object { Get-ChildItem -Path $_ -Filter *$SearchVariable* -Recurse -Force -ErrorAction SilentlyContinue }

	$SearchOutput > C:\Users\$env:username\Desktop\Output.txt

}

SearchScript


