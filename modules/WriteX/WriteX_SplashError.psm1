function WriteX_SplashError {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [switch] $message_only,

        [Parameter(Mandatory = $false)]
        [switch] $pause_after_message,

        [Parameter(Mandatory = $true)]
        [string] $message
    )
    Write-Host;
    Write-Host "== " -ForegroundColor DarkRed -NoNewline;
    Write-Host "ERROR" -ForegroundColor Yellow -NoNewline;
    Write-Host " ==" -ForegroundColor DarkRed;

    if ($message_only.IsPresent) {
        Write-Host "== " -ForegroundColor DarkRed -NoNewline;
        Write-Host $message -ForegroundColor Red -NoNewline;
        Write-Host " ==" -ForegroundColor DarkRed;

        if ($pause_after_message.IsPresent) {
            Write-Host "== " -ForegroundColor DarkRed -NoNewline;
            Write-Host "PAUSED" -ForegroundColor Yellow -NoNewline;
            Write-Host " ==" -ForegroundColor DarkRed;
            [void] [System.Console]::ReadLine();
        }
        return;
    }
    throw $message;
}
