# https://stackov   erflow.com/a/3364506/931513
function GitX_MergeOurs {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch
    )
    $branch = (GitX_Branch_OR_Master -b $branch);
    WriteX_SplashInvoke -command "git merge -s ours $branch";
}
