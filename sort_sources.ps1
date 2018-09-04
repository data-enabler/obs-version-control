Get-ChildItem "..\OBS-Settings\scenes" -Filter *.json |
Foreach-Object {
    $file = $_.FullName
    Write-Output $file
    Get-Content $file |
    jq --indent 4 '.sources |= sort_by(.name)' |
    jq --indent 4 '.groups |= sort_by(.name)' |
    Set-Content $file
}
