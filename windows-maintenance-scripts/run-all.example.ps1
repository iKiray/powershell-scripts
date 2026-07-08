#script is to run the other scripts in a folder/directory
# $ErrorActionPreference = "Stop" is not used because it will stop the whole script if one script fails
Get-ChildItem -Path $PSScriptRoot -Filter *.ps1 |
    Where-Object { $_.Name -ne "run-all.ps1" } |
    Sort-Object Name |
    ForEach-Object {
        Write-Host "=== Running $($_.Name) ==="

        try {
            & $_.FullName
            Write-Host "=== Completed ==="
        }
        catch {
            Write-Warning "=== $($_.Name) failed. ==="
        }

        Write-Host ""
    }
# Get all .ps1 files in this folder
# Skip run-all.ps1
# Sort them by name
# For each remaining script:
#     Print the script name
#     Try to run it
#     If it works, print Completed
#     If it fails, print a warning
#     Print a blank line