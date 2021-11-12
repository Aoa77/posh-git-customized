function GitX_PushForce {
    [CmdletBinding()]
    Param ( )
    [string] $currentBranch = (git rev-parse --abbrev-ref HEAD);
    [string] $status = '';
    $status = $(git status -sb); $status;
    if ($status.Contains('...')) {
        WriteX_SplashInvoke -command "git push";
    }
    else {
        WriteX_SplashInvoke -command "git push --set-upstream origin $currentBranch";
    }
}
