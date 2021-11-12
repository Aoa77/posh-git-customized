function GitX_BranchAll {
    [CmdletBinding()]
    Param ()
    WriteX_SplashInvoke -command "git branch -a";
}
