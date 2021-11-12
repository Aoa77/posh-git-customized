function SysX_Profile_Data_Edit {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [string] $name
    )
    [System.IO.FileInfo] $file = (SysX_Profile_Data -name $name);
    $editors = ("fake-editor", "code", "nano");
    foreach ($editor in $editors) {
        try {
            WriteX_SplashInvoke -splash_after -command "$editor `"$($file.FullName)`"";
            return;
        }
        catch {    }
    }
    WriteX_SplashError -message "Unable to edit $($file.Name). Tried editors: $([string]::Join(',', $editors))";
}

