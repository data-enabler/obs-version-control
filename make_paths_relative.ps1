$root = Split-Path -Parent $pwd.Path
$root = $root -replace "\\", "/"
$search1 = [regex]::escape($root) + "/OBS-Studio/bin/64bit/root"
$search2 = [regex]::escape($root)
Get-ChildItem "..\OBS-Settings\scenes" -Filter *.json |
Foreach-Object {
    $file = $_.FullName
    Write-Output "Making paths relative for $file"
    (Get-Content $file) |
    Foreach-Object { $_ -ireplace $search1, "./root" } |
    Foreach-Object { $_ -ireplace $search2, "./root" } |
    Set-Content $file
}
