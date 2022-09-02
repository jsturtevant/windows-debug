param (
    [string] $dest = "."
)

$ErrorActionPreference = "Stop"

if (-not(Test-Path -Path $dest)) {
    New-Item -Path $dest -ItemType Directory -Force
}

$scripts = @(
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/hns.psm1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/hns.v2.psm1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/VFP.psm1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/collectlogs.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/dumpVfpPolicies.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/networkhealth.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/portReservationTest.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/starthnstrace.cmd",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/starthnstrace.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/startpacketcapture.cmd",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/startpacketcapture.ps1",
    "https://raw.githubusercontent.com/microsoft/SDN/master/Kubernetes/windows/debug/stoppacketcapture.cmd"
)

foreach ($script in $scripts) {
    $filename = Split-Path $script -leaf
    Write-Output "Downloading $filename"
    $destPath = Join-Path $dest $filename
    curl.exe -L $script -o $destPath -s
}
