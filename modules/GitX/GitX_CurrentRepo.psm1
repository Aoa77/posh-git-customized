function GitX_CurrentRepo {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $L8,

        [Parameter(Mandatory = $false)]
        [switch] $SetLocation
    )
    $L8 = SysX_GetL8 $L8;
    $find = $null;
    [System.IO.DirectoryInfo] $dir = [System.IO.DirectoryInfo]::new($L8);
    while ($null -ne $dir) {
        $find = $dir.GetDirectories(".git");
        if ($find.Length -gt 0) {
            if ($SetLocation.IsPresent) {
                Set-Location $dir.FullName;
            }
            return $dir;
        }
        $dir = $dir.Parent;
    }
    if ($SetLocation.IsPresent) {
        WriteX_SplashError "Not a git repo";
    }
    return $null;
}
function GitX_CurrentRepo_SetLocation {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $L8
    )
    return (GitX_CurrentRepo -L8 $L8 -SetLocation);
}
