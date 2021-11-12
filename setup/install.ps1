Write-Host;
Write-Host "-- installing powershell-x profile --";
[string] $profile_path = [System.IO.Path]::Combine($PSScriptRoot, "profile.ps1");
$profile_file = [System.IO.FileInfo]::new($profile);
if (-Not $profile_file.Exists) {
    Write-Host "creating '$profile'";
    $profile_file.CreateText();
}
Set-Content -Path $profile "Clear-Host; Import-Module -Force -Scope `"Global`" -Name `"$profile_path`";";
Write-Host;
Write-Host "-- press enter to restart powershell --";
Write-Host;
Read-Host;
powershell;