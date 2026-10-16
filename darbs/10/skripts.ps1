$procesi = (Get-Process).Count

$darbojas = 0
$aptureeti = 0
foreach ($s in Get-Service) {
    if ($s.Status -eq 'Running') { $darbojas++ }
    elseif ($s.Status -eq 'Stopped') { $aptureeti++ }
}

$laiks = (Get-Date).AddHours(-48)
$kludas = (Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = $laiks } -ErrorAction SilentlyContinue).Count

$brivsC = [Math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB, 2)

Write-Output "Procesu skaits: $procesi"
Write-Output "Darbojas servisi: $darbojas"
Write-Output "Aptureeti servisi: $aptureeti"
Write-Output "Kludas zurnala (48h): $kludas"
Write-Output "Briva vieta C: diska: $brivsC GB"