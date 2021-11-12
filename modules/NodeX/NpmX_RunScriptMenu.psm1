function NpmX_RunScriptMenu {
    [CmdletBinding()]
    Param ()

    $scripts = NpmX_ListScripts;
    $menu = (WriteX_Menu -title "NPM scripts" -choices $scripts);
    $script = $scripts[$menu].ToString().Split(':')[0].Replace("`"", "");
    WriteX_SplashInvoke -command "npm run $script";
}
