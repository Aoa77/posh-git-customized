function GitX_BranchPurge {
    Write-Warning "Will purge all local branches!";
    GitX_BranchCheckout;
    git branch | ForEach-Object {
        Invoke-Expression "git branch -D $_";
    }
}
