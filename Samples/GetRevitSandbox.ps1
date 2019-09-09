# Import helper functions
. "$PSScriptRoot\..\Functions\Factory.ps1"

# Import user configuration
$config = GetUserConfig

# Obtains latest Revit Dev Sandbox
function GetRevitSandbox($version) {
    $fullLocalDestPath = CombinePath $config.Revit.Sandbox.($version).Destination $config.Revit.Sandbox.($version).TargetFolder
    DeleteFolderAndContents $fullLocalDestPath
    CreateDirectory $fullLocalDestPath
    $zipFile = GetLatestZipFileWithMaskInDir $config.Revit.Sandbox.($version).Mask $config.Revit.Sandbox.($version).Source
    $fullZipPath = CombinePath $config.Revit.Sandbox.($version).Source $zipFile
    CopyFileToDir $fullZipPath $config.Revit.Sandbox.($version).Destination
    $localZipPath = CombinePath $config.Revit.Sandbox.($version).Destination $zipFile
    Unzip $localZipPath $fullLocalDestPath
    $journalsFolder = CombinePath $fullLocalDestPath "Journals"
    CreateDirectory $journalsFolder
}