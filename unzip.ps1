cd $args[0]
Get-ChildItem "*.zip" | Expand-Archive -DestinationPath "." -Force
