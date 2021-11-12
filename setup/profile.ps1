Write-Host;
Write-Host "Loading powershell-x profile:" -ForegroundColor "Cyan";
Write-Host $profile -ForegroundColor "Gray";
Write-Host;

$DebugPreference = `
    [System.Management.Automation.ActionPreference]::Continue;
$ErrorActionPreference = `
    [System.Management.Automation.ActionPreference]::Stop;
$InformationPreference = `
    [System.Management.Automation.ActionPreference]::Continue;
$VerbosePreference = `
    [System.Management.Automation.ActionPreference]::Ignore;
$WarningPreference = `
    [System.Management.Automation.ActionPreference]::Inquire;

try {
    Set-ExecutionPolicy `
        -ExecutionPolicy Unrestricted `
        -Scope LocalMachine `
        -Force;
}
catch {
    Write-Debug "Set-ExecutionPolicy is not supported on this platform.";
    Write-Verbose $PSItem;
}

[string] $psx_core = [System.IO.Path]::Combine($PSScriptRoot, "psx_core.psm1");
Import-Module -DisableNameChecking -Force -Scope "Global" -Name $psx_core;
PSX_CORE_SETUP;