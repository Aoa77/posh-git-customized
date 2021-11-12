function GitX_BranchDelete {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $branch_name,

        [alias("l")]
        [Parameter(Mandatory = $false)]
        [switch] $local,

        [alias("r")]
        [Parameter(Mandatory = $false)]
        [switch] $remote,

        [alias("rn")]
        [Parameter(Mandatory = $false)]
        [string] $remote_name
    )
    if ([string]::IsNullOrWhiteSpace($remoteName)) {
        $remoteName = "origin";
    }
    $expr = "GitX_BranchDelete";
    if ($local.IsPresent) {
        $expr = "git branch -D $branch_name";
    }
    if ($remote.IsPresent) {
        $expr = "git push -d $remote_name $branch_name";
    }
    WriteX_Splash $expr;
    Write-Warning "Will delete the specified branch!";
    Invoke-Expression $expr;
}
