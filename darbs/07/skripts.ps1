$robezaGB = 20

foreach ($disks in Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3") {
    $brivsGB = [Math]::Round($disks.FreeSpace / 1GB, 2)
    Write-Output "Disks $($disks.DeviceID) - Briva vieta: $brivsGB GB"
    
    if ($brivsGB -lt $robezaGB) {
        Write-Output "BRIDINAJUMS: Uz diska $($disks.DeviceID) ir maz brivas vietas!"
    }
}