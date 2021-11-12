function SysX_Profile_Data_Directory {
    [System.IO.DirectoryInfo] $dir = SysX_Profile_Directory;
    [string] $path = [System.IO.Path]::Combine($dir.FullName, "profile-data");
    $dir = [System.IO.DirectoryInfo]::new($path);
    if (!$dir.Exists) {
        $dir.Create();
    }
    return $dir;
}
