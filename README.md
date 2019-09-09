# Powershell scripts
## Requirements
.NET Framework 4.5 (for unzipping)
Set policy for script execution
```sh
$ Set-ExecutionPolicy RemoteSigned
```
Clone this repository (requires git)
```sh
$ git clone https://github.com/stancu-mihai/PowershellAutomation.git
```
Edit own copy of config file as provided by sample
```sh
$ Config\User.psd1
```
## Available commands
- IsInstalled programName  - checks if program is installed
- InstallWithArgs fullPath arguments - installs a program with given arguments (can be located on a network path)
- GetLatestZipFileWithMaskInDir mask dir - Returns the most recent (modified date) file (with a given mask) in a directory
- CopyFileToDir file dir - copies a file to a directory
- Unzip fullZipPath dir - unzips a file into a directory
- CombinePath path1 path2 - returns the two paths combined, in order
- DeleteFolderAndContents fullFolderPath - deletes a directory and all its contents
- CreateDirectory fullDirectoryPath - creates a directory

## Sample scripts
- InstallRevit2019 - installs Revit 2019 with most contents, as specified by the config file
- CopyRevitDevSandbox - copies the last Revit Sandbox to the path specified in the config file

## Schedule a script
- Open "Task Scheduler"
- Click "Create Task", name the task
- In the "General" tab, under "Security options" specify the account that the task should be run under. Allow it to be ran if the user is not logged in.
- In the "Triggers" tab, click "New" to add new trigger. Select "On a schedule" option. Set desired time, frequency and duration of the task. Click "Ok".
- In the "Actions" tab, click "New".
- Set the Action to "Start a program"
- In the "Program/script" box enter "Powershell"
- In the "Add arguments (optional) enter the value ".\MyScript.ps1", or whatever the script name is (without path)
- In the "Start in (optional)" enter the absolute path to the script file (ex: "C:\MyScriptsFolder\MyScript)
- Click ok to save the options and the task

Note: Setting a task requires username and password. The task will no longer run when the password changes (the task must be updated)