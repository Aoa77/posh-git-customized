function GitX_PullForce {
    [CmdletBinding()]
    Param ()
    WriteX_SplashInvoke -command "git pull --force";
}
