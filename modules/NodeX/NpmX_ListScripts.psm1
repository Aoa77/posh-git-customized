function NpmX_ListScripts {
    [CmdletBinding()]
    Param ()

    $L8 = SysX_GetL8 $L8;
    $find = $null;
    [System.IO.DirectoryInfo] $dir = [System.IO.DirectoryInfo]::new($L8);
    while ($null -ne $dir) {
        $find = $dir.GetFiles("package.json");
        if ($find.Length -gt 0) {
            if ($find.Length -gt 1) {
                throw "invalid package.json location search";
            }

            $scripts = NpmX_ParsePackageJson $find[0];
            return $scripts;

        }
        $dir = $dir.Parent;
    }
    WriteX_SplashError "no npm scripts could be found";
}

