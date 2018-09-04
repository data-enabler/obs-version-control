$root = Split-Path -Parent $pwd.Path
$rootParent = Split-Path -Parent $root
$root = $root -replace "\\", "/"
$rootParent = $rootParent -replace "\\", "/"
$search1 = [regex]::escape($root) + "/OBS-Studio/bin/64bit"
$search2 = [regex]::escape($rootParent)
Get-ChildItem "..\OBS-Settings\scenes" -Filter *.json |
Foreach-Object {
    $file = $_.FullName
    Write-Output $file
    (Get-Content $file) |
    Foreach-Object { $_ -ireplace $search1, "." } |
    Foreach-Object { $_ -ireplace $search2, "." } |
    Set-Content $file
}
