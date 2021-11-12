function GitX_BranchCheckout {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch,

        [alias("n")]
        [Parameter()]
        [switch] $new,
        
        [alias("u")]
        [Parameter()]
        [string] $update
    )
    if ($new.IsPresent) {
        if ([string]::IsNullOrWhiteSpace($branch)) {
            WriteX_SplashError "new branch name not specified";
            return;
        }
        WriteX_SplashInvoke -command "git checkout -b $branch";
        return;
    }
    else {
        $branch = $(GitX_Branch_OR_Master -branch $branch -update $update);
        WriteX_SplashInvoke -command "git checkout $branch";
    }
}
