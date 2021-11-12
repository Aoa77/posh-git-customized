function SysX_Kill {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string] $name
    )
    Get-Process -Name $name | ForEach-Object {
        $_.Kill($true);
    }
}
# Add-Type -Path "CustomLibrary.dll"
# $assemblies = ("Custom.Namespace.From.Library")
# Add-Type -ReferencedAssemblies $assemblies -TypeDefinition $code -Language CSharp	........