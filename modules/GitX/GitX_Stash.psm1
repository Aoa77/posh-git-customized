function GitX_StashWorkingTree {
    WriteX_SplashInvoke -command "git stash -u";
}
function GitX_StashApply {
    WriteX_SplashInvoke -command "git stash apply";
}
