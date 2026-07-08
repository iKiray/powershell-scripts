#script is for updating the specific winget packages
$ErrorActionPreference = "Stop"

Write-Host "=== Running script..."
Write-Host ""

#list for referencing that way it only needs to be declared once
#also useful for the steps below
$packages = @(
    "Git.Git",
    "OpenJS.NodeJS",
    "Python.Python.3.13",
    "jqlang.jq"
)

#runs through the packages array like the for loop in JS that i learned
foreach ($package in $packages) {
    Write-Host "Updating $package..."
    winget upgrade --id $package --accept-source-agreements --accept-package-agreements
    Write-Host ""
}

Write-Host "Script finished. ==="