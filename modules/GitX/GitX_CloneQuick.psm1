function GitX_CloneQuick {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $repo,

        [Parameter(Mandatory = $false)]
        [string] $hub,

        [Parameter(Mandatory = $false)]
        [string] $user
    )
    if ([string]::IsNullOrWhiteSpace($hub)) {
        $hub = "https://github.com";
    }
    if ([string]::IsNullOrWhiteSpace($user)) {
        $user = "Aoa77";
    }
    $hub = $hub.TrimEnd('/');
    $user = $user.TrimStart('/').TrimEnd('/');
    $repo = $repo.TrimStart('/').TrimEnd('/');
    $url = "$hub/$user/$repo";
    WriteX_SplashInvoke -command "git clone $url";
}
