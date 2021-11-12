function SysX_Profile_Data {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $name
    )
    $name = [string]::Join('.', $name, "profile-data");
    [System.IO.DirectoryInfo] $dir = SysX_Profile_Data_Directory;
    [string] $path = [System.IO.Path]::Combine($dir.FullName, $name);
    [System.IO.FileInfo] $file = [System.IO.FileInfo]::new($path);
    if (!$file.Exists) {
        $sw = $file.CreateText();
        $sw.Close();
        $sw.Dispose();
    }
    return $file;
}
