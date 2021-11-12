function GitX_MergeTheirs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_Branch_OR_Master -b $branch);
    WriteX_SplashInvoke -command "git merge -X theirs $branch";
}
