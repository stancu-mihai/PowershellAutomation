# Import helper functions
. "$PSScriptRoot\..\Functions\Factory.ps1"

# Import user configuration
$config = GetUserConfig

# Enable use of UI
Add-Type -AssemblyName PresentationFramework

# Install Revit 2019 if not installed
function InstallRevit2019() {
    If (-Not (IsInstalled("Autodesk Revit 2019"))) {
        $msgBoxInput =  [System.Windows.MessageBox]::Show('Revit 2019 not installed. Do you want to install it?','Install software','YesNo','Error')
        switch  ($msgBoxInput) {
            'Yes' {
                InstallWithArgs $config.Revit.Install.R2019.Path $config.Revit.Install.R2019.Args
            }
            'No' {
                exit
            }
        }
    }
}