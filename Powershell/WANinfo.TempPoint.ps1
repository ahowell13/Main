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


function WANinfo {
	
	#Get public ip address
	
	$ipaddr = (Invoke-RestMethod 'https://api.ipify.org?format=json').ip
	
	#Resolve public ip DNS
	
	$nameresolve = Resolve-DnsName -Name $ipaddr -Type PTR
	
	#resolve wan ip to isp
	
	$ISPresult = switch -wildcard ($nameresolve)
	{
		"*comcast*" {"Comcast"}
		"*frontier*" {"Frontier"}
		"*spectrum*" { "Spectrum" }
		"*sbcglobal*" {"AT&T"}
	}
}