function GitX_ResetOrigin {
    [CmdletBinding()]
    Param (
        [alias("h")]
        [Parameter()]
        [switch] $hard
    )
    if ($hard.IsPresent) {
        WriteX_SplashInvoke -command "git reset --hard origin";
    } else {
        WriteX_SplashInvoke -command "git reset --soft origin";
    }
}


