function PSX_CORE_SETUP {
    PSX_ACTION_L1 (
        "psx_core setup script"
    );
    PSX_CORE;
    PSX_IMPORT_PROMPT;
    PSX_ACTION_L1 (
        "psx_core setup complete :)"
    );
    WriteX_NewLine;
}
function PSX_CORE {
    [string] $PSX_ROOT = (
        (Get-Item $PSScriptRoot).Parent.FullName
    );
    PSX_ACTION_L2 (
        "importing dependencies"
    );
    PSX_IMPORT (
        [System.IO.Path]::Combine(
            $PSX_ROOT,
            "dependencies",
            "posh-git",
            "posh-git.psd1"
        )
    );
    PSX_ACTION_L2 (
        "importing module library"
    );
    PSX_IMPORT_FOLDER (
        [System.IO.Path]::Combine(
            $PSX_ROOT,
            "modules"
        )
    );
    PSX_ACTION_L2 (
        "updating alias definitions"
    );
    PSX_UPDATE_ALIASES;
}
function PSX_IMPORT ([string] $module) {
    Import-Module -DisableNameChecking -Force -Scope "Global" -Name $module;
}
function PSX_IMPORT_FOLDER ([string] $path) {
    $import_root = [System.IO.DirectoryInfo]::new($path);
    [string] $last_parent = "";
    foreach ($file in $import_root.GetFiles("*.psm1", [System.IO.SearchOption]::AllDirectories)) {
        if ($file.DirectoryName -ne $last_parent) {
            $last_parent = $file.DirectoryName;
            PSX_ACTION_L3 (
                [System.IO.Path]::Combine(
                    $file.Directory.Parent.Parent.Name,
                    $file.Directory.Parent.Name,
                    $file.Directory.Name
                )
            );
        }
        PSX_IMPORT $file.FullName;
    }
}
function PSX_IMPORT_PROMPT () {
    PSX_ACTION_L2 (
        "applying prompt customizations"
    );
    PSX_IMPORT (
        [System.IO.Path]::Combine(
            $PSScriptRoot,
            "psx_prompt.psm1"
        )
    );
}
function PSX_UPDATE_ALIASES {
    PSX_ACTION_L3 "removing current alias definitions";
    PSX_IMPORT (
        [System.IO.Path]::Combine(
            $PSScriptRoot,
            "psx_aliases.psm1"
        )
    );
    PSX_ALIASES -remove;
    PSX_ACTION_L3 "creating new alias definitions";
    PSX_ALIASES;
}

function PSX_ACTION_L1 ([string] $action) {
    Write-Host "• " -ForegroundColor DarkGreen -NoNewline;
    Write-Host $action -ForegroundColor Green;
}
function PSX_ACTION_L2 ([string] $action) {
    Write-Host "   • " -ForegroundColor DarkCyan -NoNewline;
    Write-Host $action -ForegroundColor Cyan;
}
function PSX_ACTION_L3 ([string] $action) {
    Write-Host "      • " -ForegroundColor DarkBlue -NoNewline;
    Write-Host $action -ForegroundColor Blue;
}