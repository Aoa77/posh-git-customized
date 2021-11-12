function SysX_Profile_Directory {
    [System.IO.FileInfo] $file = SysX_Profile_File;
    [System.IO.DirectoryInfo] $dir = $file.Directory;
    return $dir;
}
