function SysX_GetL8 {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $L8
    )
    if ([string]::IsNullOrWhiteSpace($L8)) {
        $L8 = Get-Location;
    }
    return $L8;
}
