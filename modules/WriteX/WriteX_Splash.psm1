function WriteX_Splash {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [switch] $clear,

        [Parameter(Mandatory = $true)]
        [string] $message
    )
    if ($clear.IsPresent) {
        Clear-Host;
    }
    else {
        WriteX_NewLine 2;
    }
    $length = "== $message ==";
    $banner = [System.Text.StringBuilder]::new();
    for ($i = 0; $i -lt $length.Length; $i++) {
        [void]$banner.Append("#");
    }
    Write-Host $banner.ToString() -ForegroundColor DarkBlue;
    Write-Host "== " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $message -ForegroundColor Cyan -NoNewline;
    Write-Host " ==" -ForegroundColor DarkBlue;
    Write-Host $banner.ToString() -ForegroundColor DarkBlue;
}
