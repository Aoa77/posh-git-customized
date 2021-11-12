function NpmX_ParsePackageJson {
    [CmdletBinding()]
    Param (
        [Parameter()]
        [string] $path
    )
    $regexObj = [System.Text.RegularExpressions.Regex]::new(`
            "`"scripts`": \{(.*?)\},", `
            [System.Text.RegularExpressions.RegexOptions]::Singleline`
    );
    $match = $regexObj.Match([System.IO.File]::ReadAllText($path));
    if (!$match.Success) {
        WriteX_SplashError "unable to find npm scripts";
    }
    $scriptBlock = $match.Groups[1].Value.Trim();
    $regexObj = [System.Text.RegularExpressions.Regex]::new("`"(.*?)`": `"(.*?)`",");
    return $regexObj.Matches($scriptBlock);
}