function PSX_ALIASES {
    [CmdletBinding()]
    Param (

        [alias("r")]
        [Parameter()]
        [switch] $remove
    )

    # tanzu/k8s
    PSX_ALIAS -r:$r -t "kubectl" -a "k";
    PSX_ALIAS -r:$r -t "TanzuX_ConfigMenu" -a "t";

    # npm scripts
    PSX_ALIAS -r:$r -t "NpmX_Install" -a "ni";
    PSX_ALIAS -r:$r -t "NpmX_RunScriptMenu" -a "nx";
    PSX_ALIAS -r:$r -t "NpmX_Uninstall" -a "nu";

    # GitX aliases
    PSX_ALIAS -r:$r -t "GitX_Branch" -a "gb";
    PSX_ALIAS -r:$r -t "GitX_BranchAll" -a "gba";
    PSX_ALIAS -r:$r -t "GitX_BranchCheckout" -a "gcx";
    PSX_ALIAS -r:$r -t "GitX_BranchPurge" -a "gbp";
    PSX_ALIAS -r:$r -t "GitX_BranchRemote" -a "gbr";
    PSX_ALIAS -r:$r -t "GitX_BranchUnsetUpstream" -a "gbu";
    PSX_ALIAS -r:$r -t "GitX_BranchUnsetUpstream" -a "gbuu";
    PSX_ALIAS -r:$r -t "GitX_BranchVerbose" -a "gbv";
    PSX_ALIAS -r:$r -t "GitX_CleanForce" -a "gcf";
    PSX_ALIAS -r:$r -t "GitX_CleanInteractive" -a "gci";
    PSX_ALIAS -r:$r -t "GitX_CleanPreview" -a "gc";
    PSX_ALIAS -r:$r -t "GitX_CleanPreview" -a "gcp";
    PSX_ALIAS -r:$r -t "GitX_CloneQuick" -a "gcq";
    PSX_ALIAS -r:$r -t "GitX_ConfigPub" -a "ggp";
    PSX_ALIAS -r:$r -t "GitX_ConfigWork" -a "ggw";
    PSX_ALIAS -r:$r -t "GitX_CurrentRepo_SetLocation" -a "grx";
    PSX_ALIAS -r:$r -t "GitX_CurrentRepo" -a "gr";
    PSX_ALIAS -r:$r -t "GitX_Fetch" -a "gf";
    PSX_ALIAS -r:$r -t "GitX_MergeAbort" -a "gma";
    PSX_ALIAS -r:$r -t "GitX_MergeOurs" -a "gmo";
    PSX_ALIAS -r:$r -t "GitX_MergeTheirs" -a "gmt";
    PSX_ALIAS -r:$r -t "GitX_Pull" -a "gp";
    PSX_ALIAS -r:$r -t "GitX_PullForce" -a "gpf";
    PSX_ALIAS -r:$r -t "GitX_PullOrigin" -a "gpo";
    PSX_ALIAS -r:$r -t "GitX_PullOriginForce" -a "gpof";
    PSX_ALIAS -r:$r -t "GitX_Push" -a "gpx";
    PSX_ALIAS -r:$r -t "GitX_PushForce" -a "gpxf";
    PSX_ALIAS -r:$r -t "GitX_PushQuick" -a "gq";
    # PSX_ALIAS -r:$r -t "GitX_Remote" -a "gr";
    # PSX_ALIAS -r:$r -t "GitX_RemoteChrome" -a "grc";
    PSX_ALIAS -r:$r -t "GitX_RepoMenu" -a "g";
    PSX_ALIAS -r:$r -t "GitX_ResetOrigin" -a "gro";
    PSX_ALIAS -r:$r -t "GitX_StashApply" -a "gsa";
    PSX_ALIAS -r:$r -t "GitX_StashWorkingTree" -a "gsx";
    PSX_ALIAS -r:$r -t "GitX_Status" -a "gs";

    # SysX aliases
    PSX_ALIAS -r:$r -t "Clear-Host" -a "c";
    PSX_ALIAS -r:$r -t "SysX_GetChildItem" -a "lsx";
    PSX_ALIAS -r:$r -t "SysX_GetChildItem" -a "l";
    PSX_ALIAS -r:$r -t "SysX_GetLocation_EtcHosts" -a "etc";
    PSX_ALIAS -r:$r -t "SysX_SetLocation" -a "cd";
    PSX_ALIAS -r:$r -t "SysX_SetLocation_work" -a "w";
    PSX_ALIAS -r:$r -t "SysX_SetLocation_zone" -a "z";

    # program aliases
    PSX_ALIAS -r:$r -a "chrome" -t `
        "C:\Program Files\Google\Chrome\Application\chrome.exe";

    PSX_ALIAS -r:$r -a "devenv" -t `
        "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\devenv.exe";
#t2zdelxtpafdcavq3q6rqebsh3yzr2oqjp3ljx7rbm4b5g3uqueq

}
function PSX_ALIAS {
    [CmdletBinding()]
    Param (
        [alias("r")]
        [Parameter()]
        [switch] $remove,

        [alias("a")]
        [Parameter()]
        [string] $alias,

        [alias("t")]
        [Parameter()]
        [string] $target
    )

    if ($remove.IsPresent) {
        [void] (Remove-Alias $alias -Force -Scope "Global" -ErrorAction ([System.Management.Automation.ActionPreference]::Ignore));
    }
    else {
        Set-Alias -Force -Option AllScope -Scope "Global" -Value $target -Name $alias;
    }
}
