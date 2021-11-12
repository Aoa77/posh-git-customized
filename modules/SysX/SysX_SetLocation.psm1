function SysX_SetLocation ([string] $location) {
    try {
        $file = [System.IO.FileInfo]::new($location);
        if ($file.Exists) {
            Write-Host "";
            Write-Host "...location is file, navigating to its parent directory..." -ForegroundColor "Yellow";
            $location = $file.DirectoryName;
        }
        Set-Location $location;
    }
    catch {
        #WriteX_SplashError -message_only -pause_after_message -message $_;
        WriteX_SplashError -message $_;
    }
}