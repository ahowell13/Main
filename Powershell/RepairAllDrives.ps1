<#	Author: Austin Howell
	Date: 01.21.2019

	Two functions: One that only scans and reports errors, and one that fixes them.

#>


function ScanAllDrives {

	(Get-Volume).DriveLetter | ForEach-Object { Repair-Volume -DriveLetter $_ -Scan -ErrorAction SilentlyContinue }

}


function FixAllDrives {

(Get-Volume).DriveLetter | ForEach-Object { Repair-Volume -DriveLetter $_ -Spotfix -ErrorAction SilentlyContinue }

}


