function SysX_Profile_Data_ReadAllLines {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $name
    )
    [System.IO.FileInfo] $file = (SysX_Profile_Data -name $name);
    $lines = [System.IO.File]::ReadAllLines($file.FullName);
    return $lines;
}
