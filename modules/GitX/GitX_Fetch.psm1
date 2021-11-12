function GitX_Fetch {
    [CmdletBinding()]
    Param (
        [switch] $prune_local
    )
    WriteX_NewLine;
    WriteX_SplashInvoke -command "git fetch --all --prune --tags";
    $regex = [System.Text.RegularExpressions.Regex]::new("^(.*?)\[origin/(.*?): gone\](.*?)$", [System.Text.RegularExpressions.RegexOptions]::Multiline);

    $to_prune = [System.Collections.Generic.List[string]]::new();
    git branch -ravv | ForEach-Object {
        if ($regex.IsMatch($_)) {
            $to_prune.Add($($regex.Match($_).Groups[2].Value));
        };
    }
    if ($to_prune.Count -gt 0) {
        WriteX_NewLine;
        WriteX_Splash -message "Local Orphaned Branches";
        $to_prune | ForEach-Object {
            Write-Host "- " -ForegroundColor "Gray" -NoNewline;
            Write-Host $_ -ForegroundColor "Yellow" -NoNewline;
            if ($prune_local.IsPresent) {
                git branch -D $_;
                Write-Host " *** PRUNED ***" -ForegroundColor "Red" -NoNewline;
            }
            WriteX_NewLine;
        }
    }
    GitX_BranchAll;
}
