
function WriteX_SplashInvoke {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [switch] $clear,

        [Parameter(Mandatory = $false)]
        [switch] $splash_after,

        [Parameter(Mandatory = $true)]
        [string] $command
    )
    if (!$splash_after.IsPresent) {
        WriteX_Splash -clear:$clear -message $command;
    }
    Write-Host "please wait..." -ForegroundColor Yellow;
    Invoke-Expression -Command $command;
    if ($splash_after.IsPresent) {
        WriteX_Splash -clear:$clear -message $command;
    }
}
