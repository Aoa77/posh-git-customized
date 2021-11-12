function GitX_Prompt {
    [CmdletBinding()]
    Param ()

    [string]$loc = (Get-Location);
    Write-Host $loc -ForegroundColor "DarkGreen";
    $repo = GitX_CurrentRepo;
    if ($null -ne $repo) {
        [string] $vcsStatus = Write-VcsStatus;
        Write-Host $vcsStatus;
    }
}