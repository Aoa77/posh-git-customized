function SysX_GetChildItem {
    [CmdletBinding()]
    Param ()
    WriteX_SplashInvoke -command "Get-ChildItem -Force";
}
