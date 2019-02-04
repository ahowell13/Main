$DNSserver1 = Read-Host "Enter the first DNS server"
$DNSserver2 = Read-Host "Enter the second DNS server"

# Get the active interface index of the local machine

$ifindex = (Get-NetAdapter | where status -eq "Up").ifindex

# Set the DNS Server on the local machine

Set-DnsClientServerAddress -InterfaceIndex $ifindex -ServerAddresses ("$DNSserver1", "$DNSserver2")

# Failsafe so that remote computer won't lose internet


Try {

	( Test-NetConnection 8.8.8.8 ) -and ( Test-NetConnection 8.8.4.4 ) -and ( Test-NetConnection 1.1.1.1 ) -and ( Test-NetConnection 1.0.0.1 )

	Write "success"
}

Catch {

	Set-DnsClientServerAddress -InterfaceIndex $ifIndex -ResetServerAddresses
	
	Write "Failure"
}




