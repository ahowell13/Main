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
	
	if ($num % 3 -eq 0)
	{
		
		Write-Output "Fizz"
	}
	
	
	if ($num % 5 -eq 0)
	{
		
		Write-Output "Buzz"
	}
	
	if ($num % 5 -and $num % 3 -eq 0)
	{
		
		Write-Output "Fizzbuzz"
	}
	
	else { Write-Output $num }
	
}

