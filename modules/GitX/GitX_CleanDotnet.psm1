function GitX_CleanDotnet {
    [CmdletBinding()]

    Param (
        [alias("f")]
        [Parameter(Mandatory = $false)]
        [switch] $Force
    )
    $regex = [System.Text.RegularExpressions.Regex]::new("^(?:.*)(?:/bin/|/obj/|/packages/|/\.vs/|BuildOutput/|\.csproj\.user|/TestResults/)$");
    $teeLog = "$(Get-Location)\tee-object.log";
    git clean -fdxn | Tee-Object -FilePath $teeLog;
    $items = [System.IO.File]::ReadAllLines($teeLog);
    foreach ($raw in $items) {
        $item = $raw.Replace("Would remove ", "");
        if ($regex.IsMatch($item)) {
            Remove-Item -LiteralPath $item -Recurse -Force;
        }
    }
}
