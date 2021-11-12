

function GitX_ConfigProfile_Pub {
    [CmdletBinding()]
    Param ()
    WriteX_Splash -message "GitX_ConfigProfile_Pub";
    GitX_Config -user_name "aoa77" -user_email "alalbers77@gmail.com";
    GitX_npmrc "pub";
}

function GitX_ConfigProfile_Work {
    [CmdletBinding()]
    Param ()
    WriteX_Splash -message "GitX_ConfigProfile_Work";
    GitX_Config -user_name "Al Albers" -user_email "albert.albers@identifix.com";
    GitX_npmrc "work";
}

function GitX_Config {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $user_name,

        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $user_email,
        
        [Parameter(Mandatory = $false)]
        [switch] $show_status
    )

    # git profile
    GitX_CurrentRepo -SetLocation;
    git config user.name $user_name;
    git config user.email $user_email;
    git config --global pager.branch false;
    git config --global diff.tool ;
    git config --global difftool..cmd "code --wait --diff $LOCAL $REMOTE";
    git config --global difftool.prompt false;
    git config --global merge.tool;
    git config --global mergetool..cmd "code --wait $MERGED";
    git config --global mergetool.keepBackup false;

    WriteX_NewLine 1;
    if ($show_status.IsPresent) {
        git config --list;
        WriteX_NewLine 2;
    }
}

function GitX_npmrc {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { ![string]::IsNullOrWhiteSpace($_) })]
        [string] $profile
    )

    # always default to work in the global ~/[user-profile] context
    # npmrc work;
    Copy-Item -Path "~/.npmrcs/$profile" -Destination ".npmrc" -Force;
}