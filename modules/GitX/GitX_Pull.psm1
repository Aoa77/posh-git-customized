function GitX_Pull {
    [CmdletBinding()]
    Param (
        [alias("fx")]
        [Parameter()]
        [switch] $ForceAll,

        [alias("af")]
        [Parameter()]
        [switch] $AlsoFetch
    )
    Push-Location;
    $repo_set = ("$(Get-Location)");
    if ($ForceAll.IsPresent) {
        $repo_set = GitX_RepoList;
    }
    foreach ($repo in $repo_set) {
        Set-Location $repo;
        WriteX_Splash $repo;
        if ($AlsoFetch.IsPresent) {
            GitX_Fetch;
        }
        WriteX_SplashInvoke -command "git pull";
    }
    Pop-Location;
}
