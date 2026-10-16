$darbojas = 0
$aptureeti = 0

foreach ($s in Get-Service) {
    if ($s.Status -eq 'Running') {
        $darbojas++
    }
    elseif ($s.Status -eq 'Stopped') {
        $aptureeti++
    }
}

$summa = $darbojas + $aptureeti

Write-Output "Darbojas: $darbojas"
Write-Output "Aptureeti: $aptureeti"
Write-Output "Summa: $summa"