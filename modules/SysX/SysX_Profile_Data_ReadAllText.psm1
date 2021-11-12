function SysX_Profile_Data_ReadAllText {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $name
    )
    [System.IO.FileInfo] $file = (SysX_Profile_Data -name $name);
    [string] $text = [System.IO.File]::ReadAllText($file.FullName);
    return $text;
}
