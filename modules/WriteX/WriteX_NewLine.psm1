function WriteX_NewLine {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [int] $count
    )
    if ($count -eq 0) {
        $count = 1;
    }
    for ($i = 0; $i -lt $count; $i++) {
        Write-Host "";
    }
}
