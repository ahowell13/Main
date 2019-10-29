<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2019 v5.6.168
	 Created on:   	10/28/2019 20:37
	 Created by:   	austi
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


for ($num = 1; $num -le 100; $num++)
{
	
	$output = ""
	
	if ($num % 3 -eq 0) { $output += "Fizz" }
	if ($num % 5 -eq 0) { $output += "Buzz" }
	
	if ($output -eq "") { $output = $num }
	
	Write-Output $output
	
	
	
	
}