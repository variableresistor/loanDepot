<#
.SYNOPSIS
    Returns the first recurring character in from the input string.
.PARAMETERS Input
    String to return the first recurring character from.
.PARAMETERS Method
    The method used to return the first repeating character
.LINK
    https://powershellexplained.com/2018-10-15-Powershell-arrays-Everything-you-wanted-to-know/
.AUTHOR
    Neil White
#>
[CmdletBinding()]
[OutputType([string])]
param
(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$InputString

    ,[ValidateSet("Pretty","Dotnet")]
    [string]$Method = "Pretty"
)
#requires -Version 5 -PSEdition Desktop

process
{
    # The Switch statement in Windows PowerShell is way slower than in Core, so use if, elseif structure
    $CharArray = $InputString.ToCharArray()
    if ($Method -eq "Pretty")
    {
        $CharsAlreadyTried = @()

        foreach ($Char in $CharArray)
        {
            # The -in comparison operator is already case-insensitive
            if ($Char -in $CharsAlreadyTried) { return $Char }
            else { $CharsAlreadyTried += $Char }
        }
    }
    elseif ($Method -eq "Dotnet")
    {
        $CharsAlreadyTried = [System.Collections.Generic.List[string]]::new()

        foreach ($Char in $CharArray)
        {
            if ($CharsAlreadyTried.Contains($Char)) { return $Char }
            else
            {
                $CharsAlreadyTried.Add($Char.ToString().ToLower())
                $CharsAlreadyTried.Add($Char.ToString().ToUpper())
            }
        }
    }
    else { throw "Method $Method was invalid" }
}
