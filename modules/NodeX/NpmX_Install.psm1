function NpmX_Install {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string] $args
    )
    WriteX_SplashInvoke -command  "npm install $args";
}
