
function GitX_RepoList_RootFolders {
    [CmdletBinding()]
    Param ()
    [string[]] $lines = (SysX_Profile_Data_ReadAllLines -name "GitX_RepoList_RootFolders");
    return $lines;
}
function GitX_RepoList {
    [CmdletBinding()]
    Param ()
    $repos = [System.Collections.Generic.List[string]]::new();
    GitX_RepoList_RootFolders | ForEach-Object {
        $root = $_;
        $dirs = [System.IO.Directory]::GetDirectories($root);
        $dirs | ForEach-Object {
            $dir = $_;
            $git = [System.IO.Directory]::GetDirectories($dir, ".git");
            if ($git.Length -eq 1) {
                $repos.Add($dir);
            }
        };
    }
    return $repos;
}



