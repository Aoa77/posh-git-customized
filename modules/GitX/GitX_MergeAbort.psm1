function GitX_MergeAbort {
    [CmdletBinding()]
    Param ()
    WriteX_SplashInvoke -command "git merge --abort";
}
