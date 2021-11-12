function GitX_Branch_OR_Master {
    [CmdletBinding()]
    Param (
        [alias("b")]
        [Parameter()]
        [string] $branch,

        [alias("u")]
        [Parameter()]
        [string] $update
    )
    $path = [System.IO.Path]::Combine($(GitX_CurrentRepo), ".git", "master_branch");
    $master_branch_file = [System.IO.FileInfo]::new($path);
    if ([string]::IsNullOrWhiteSpace($update)) {
        $update = "master";
    }
    else {
        [System.IO.File]::WriteAllText($master_branch_file.FullName, $update);
    }
    if ([string]::IsNullOrWhiteSpace($branch)) {
        if (!$master_branch_file.Exists) {
            [System.IO.File]::WriteAllText($master_branch_file.FullName, $update);
        }
        $branch = [System.IO.File]::ReadAllText($master_branch_file.FullName);
    }
    return $branch;
}


