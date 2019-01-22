<# This script is meant for work-related purposes

	Author: Austin Howell
	Date: 01.21.2019

#>

function FixOpenDNS {

	Stop-Service Umbrella_RC

	sleep -s 10

	$ifIndex = (Get-NetAdapter | where Status -eq Up).ifIndex

	Set-DnsClientServerAddresses -InterfaceIndex $ifIndex -ResetServerAddresses

	Start-Service Umbrella_RC
}


