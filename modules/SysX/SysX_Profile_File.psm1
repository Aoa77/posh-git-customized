function SysX_Profile_File {
    $file = [System.IO.FileInfo]::new($PROFILE);
    return $file;
}
