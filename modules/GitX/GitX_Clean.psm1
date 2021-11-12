 function GitX_Clean {
    [CmdletBinding()]
    Param (
        [switch] $sub,
        [string] $flags
    )
    Push-Location;
    GitX_CurrentRepo_SetLocation;
    if ($flags.Length -lt 1) {
        $flags = "fdxn;"   # default is preview
    }
    $flags = $flags.TrimStart('-');
    WriteX_SplashInvoke -command "git clean -$flags";
    Pop-Location;
}
