function WriteX_Menu {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string] $title,

        [Parameter(Mandatory = $true)]
        [array] $choices,

        [Parameter(Mandatory = $false)]
        [string] $footer_expression
    )

    [bool] $EnterPressed = $false;
    [int] $MaxValue = $choices.count - 1;
    [int] $MenuSelectionCursorLeftReset = 0;
    [int] $MenuTitleSplashHeight = 3;
    [int] $MenuFooterRowStart = $MaxValue + $MenuTitleSplashHeight + 2;
    [int] $Selection = 0;

    WriteX_Splash -clear -message $title;
    [System.Console]::CursorLeft = $MenuSelectionCursorLeftReset;
    [System.Console]::CursorTop = $MenuFooterRowStart;
    if (-Not [string]::IsNullOrWhiteSpace($footer_expression)) {
        Invoke-Expression $footer_expression;
    }

    while ($EnterPressed -eq $false) {
        for ($i = 0; $i -le $MaxValue; $i++) {
            [System.Console]::CursorLeft = $MenuSelectionCursorLeftReset;
            [System.Console]::CursorTop = ($i + $MenuTitleSplashHeight);

            if ($i -eq $Selection) {
                Write-Host -BackgroundColor Cyan -ForegroundColor Black "[ $($choices[$i]) ]";
            }
            else {
                Write-Host "  $($choices[$i])  ";
            }
        }
        $KeyInput = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown").virtualkeycode;
        #Write-Host "`$KeyInput: $KeyInput";
        switch ($KeyInput) {
            { $_ -in (13, 39) } {
                $EnterPressed = $true;
                Clear-Host;
                return $Selection;
            }
            { $_ -in (27, 37) } {
                return -1;
            }
            38 {
                if ($Selection -eq 0) {
                    $Selection = $MaxValue;
                }
                else {
                    $Selection -= 1;
                }
                break;
            }
            40 {
                if ($Selection -eq $MaxValue) {
                    $Selection = 0;
                }
                else {
                    $Selection += 1;
                }
                break;
            }
            default { break; }
        }
    }
}
function SwitchTo_Window {
    Param(
        [string] $proc = "C:\Program Files (x86)\Citrix\ICA Client\concentr.exe",
        [string] $adm
    )
    Clear-Host

    Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class WinAp {
      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool SetForegroundWindow(IntPtr hWnd);

      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@
    $p = Get-Process | Where-Object { $_.mainWindowTitle } |
    Where-Object { $_.Name -like "$proc" }
    if (($null -eq $p) -and ($adm -ne "")) {
        Start-Process "$proc" -Verb runAs
    }
    elseif (($null -eq $p) -and ($adm -eq "")) {
        Start-Process "$proc"
    }
    else {
        $h = $p.MainWindowHandle
        [void] [WinAp]::SetForegroundWindow($h)
        [void] [WinAp]::ShowWindow($h, 3)
    }
}
