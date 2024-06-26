Get-ChildItem "..\OBS-Settings\scenes" -Filter *.json |
Foreach-Object {
    $file = $_.FullName
    Write-Output "Sorting fields in $file"
    Get-Content $file |
    jq --sort-keys --indent 4 '.sources |= sort_by(.name) | .groups |= sort_by(.name)' |
    Set-Content $file
}
