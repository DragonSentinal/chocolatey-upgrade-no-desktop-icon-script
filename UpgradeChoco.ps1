$UserDesktopPath = [Environment]::GetFolderPath("Desktop")
$PublicDesktopPath = [Environment]::GetFolderPath("CommonDesktopDirectory")
$UserDesktopIcons = Get-ChildItem $UserDesktopPath -Name
$PublicDesktopIcons = Get-ChildItem $PublicDesktopPath -Name
choco upgrade chocolatey -y
choco upgrade all -y --except="'chocolatey'"
cd $UserDesktopPath
Compare-Object -ReferenceObject @($UserDesktopIcons | Select-Object) -DifferenceObject @((Get-ChildItem $UserDesktopPath -Name) | Select-Object) -PassThru | Remove-Item -Verbose
cd $PublicDesktopPath
Compare-Object -ReferenceObject @($PublicDesktopIcons | Select-Object) -DifferenceObject @((Get-ChildItem $PublicDesktopPath -Name) | Select-Object) -PassThru | Remove-Item -Verbose
read-host "Press Enter to exit..."