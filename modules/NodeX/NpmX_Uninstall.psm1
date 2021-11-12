function NpmX_Uninstall {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string] $args
    )
    WriteX_SplashInvoke -command  "npm uninstall $args";
}
