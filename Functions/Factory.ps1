# Enables unzipping
Add-Type -Path "C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5\System.IO.Compression.FileSystem.dll"

# Gets user config
function GetUserConfig() {
    $config = Import-LocalizedData -BaseDirectory $PSScriptRoot\..\Config -FileName User.psd1
    if ([string]::IsNullOrEmpty($config))
    {
        Write-Host "FATAL ERROR! Missing config info."
    }
    return $config
}

# Checks if a program is installed
function IsInstalled( $program ) {
    
    $x86 = ((Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    $x64 = ((Get-ChildItem "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
        Where-Object { $_.GetValue( "DisplayName" ) -like "*$program*" } ).Length -gt 0;

    return $x86 -or $x64;
}

# Installs an app with given arguments
function InstallWithArgs( $fullpath, $arguments ) {
    $filename = Split-Path -Path $fullpath -Leaf
    Start-Process -FilePath "z:\$($filename)" -ArgumentList $arguments -Wait
}

# Obtains full path of a file with a certain mask in a specified directory
function GetLatestZipFileWithMaskInDir( $mask, $dir) {
    $test = Get-ChildItem -Path $dir -Filter $mask | Sort-Object LastWriteTime | Select-Object -last 1
    return $test.Name
}

# Copies a file to a directory
function CopyFileToDir( $file, $dir ) {
    Copy-Item $file -Destination $dir
}

# Unzips into a directory
function Unzip( $fullZipPath, $dir) {
    [System.IO.Compression.ZipFile]::ExtractToDirectory($fullzippath, $dir)
}

# Combines paths
function CombinePath( $path1, $path2) {
    $newPath = [Io.Path]::Combine($path1, $path2)
    return $newPath
}

# Delete folder and contents
function DeleteFolderAndContents( $fullFolderPath ) {
    Remove-Item -Force -Recurse -Path $fullFolderPath
}

# Creates a directory
function CreateDirectory ( $fullDirPath ) {
    New-Item $fullDirPath -ItemType Directory
}