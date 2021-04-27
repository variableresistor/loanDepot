Describe "Get-FirstRepeatedCharacter.ps1" {
    Context "Using 'Pretty' method" {
        It "Outputs a 'c' in an unordered string" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "eccdr" -Method Pretty | Should -Be "c"
        }

        It "Outputs a 'c' only when multiple characters repeat within the string" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "ecddrra" -Method Pretty | Should -Be "d"
        }

        It "Is case insensitive, returns the case of the first letter passed in" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "ecDdra" -Method Dotnet | Should -Be "D"
        }
    }
    Context "Using 'Dotnet' method" {
        It "Outputs a 'c' in an unordered string" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "eccdr" -Method Dotnet | Should -Be "c"
        }

        It "Outputs a 'c' only when multiple characters repeat within the string" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "ecddrra" -Method Dotnet | Should -Be "d"
        }

        It "Is case insensitive, returns the case of the first letter passed in" {
            . "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1" -InputString "ecDdra" -Method Dotnet | Should -Be "D"
        }
    }

    It "Has certain parameters and properties" {
        $CommandInfo = Get-Command "$PSScriptRoot\Get-FirstRepeatedCharacter.ps1"

        $CommandInfo | Should -HaveParameter InputString -Type ([System.String]) -Mandatory
        $CommandInfo | Should -HaveParameter Method -Type ([System.String])
    }
}