<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.169
	 Created on:   	1/14/2020 12:51
	 Created by:   	austi
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


function WANinfo
{
	
	#Get public ip address
	
	$ipaddr = (Invoke-RestMethod 'https://api.ipify.org?format=json').ip
	
	#Resolve public ip DNS
	
	$nameresolve = (Resolve-DnsName -Name $ipaddr -Type PTR).namehost
	
	#resolve wan ip to isp
	
	$ISPresult = switch -wildcard ($nameresolve)
	{
		"*comcast*" { "Comcast"; break }
		"*frontier*" { "Frontier"; break }
		"*spectrum*" { "Spectrum"; break }
		"*sbcglobal*" { "AT&T"; break }
		default { "Unable to determine ISP"; break }
	}
	
	Write-Host "Your Public IP Address is: " $ipaddr
	Write-Host "Your ISP is: " $ISPresult
	
}


function LANinfo
{
	
	#Get Active Interface
	
	$activeinterface = Get-CimInstance CIM_NetworkAdapter | Where-Object { $_.PhysicalAdapter -eq "True" -and $_.NetEnabled -eq "True" -and $_.Name -ne "Npcap Loopback Adapter" -and $_.AdapterType -eq "Ethernet 802.3" }
	
	#Get info for identified interface
	
	$LANinfo = Get-NetIPConfiguration -InterfaceIndex $activeinterface.interfaceindex
	
	$LANinfo
	
}