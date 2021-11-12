function GitX_RepoMenu {
    [CmdletBinding()]
    Param ()
    $repos = GitX_RepoList;
    $menu = (WriteX_Menu -title "GitX - choose repository folder." -choices $repos);
    $repo = $repos[$menu];
    SysX_SetLocation $repo;
}
