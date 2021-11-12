function GitX_PushQuick {
    [CmdletBinding()]
    Param (
        [alias("f")]
        [Parameter()]
        [switch] $force_all,

        [alias("m")]
        [Parameter()]
        [string] $message
    )
    Push-Location;
    $repo_set = ("$(Get-Location)");
    if ($force_all.IsPresent) {
        $repo_set = GitX_RepoList;
    }
    foreach ($repo in $repo_set) {
        Set-Location $repo;
        GitX_PushQuick_CurrentLocation -m $message;
    }
    Pop-Location;
}
function GitX_PushQuick_CurrentLocation {
    [CmdletBinding()]
    Param (
        [alias("m")]
        [Parameter()]
        [string] $message
    )
    if ([string]::IsNullOrWhiteSpace($message)) {
        $message = "* committed by GitX_PushQuick *";
    }
    Push-Location;
    GitX_CurrentRepo_SetLocation;
    git add .;
    git commit -m $message;
    GitX_PushForce;
    Pop-Location;
}
