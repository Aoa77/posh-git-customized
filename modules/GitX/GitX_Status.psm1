function GitX_Status {
    [CmdletBinding()]
    Param ()
    Invoke-Expression "git status -s" | ForEach-Object {
        $file = $_.Trim().Replace("??", "U");
        $color = (GitX_Status_Color -git_status $file[0])
        Write-Host $file -ForegroundColor $color;
    }
}
function GitX_Status_Color {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [char] $git_status
    )
    [System.ConsoleColor] $color = [System.Console]::ForegroundColor;
    switch ($file[0]) {
        "D" { $color = [System.ConsoleColor]::Red; }
        "M" { $color = [System.ConsoleColor]::Blue; }
        "U" { $color = [System.ConsoleColor]::White; }
    }
    return $color;
}