function GitX_Branch {
    [CmdletBinding()]
    Param ()
    WriteX_SplashInvoke -command "git branch";
}
