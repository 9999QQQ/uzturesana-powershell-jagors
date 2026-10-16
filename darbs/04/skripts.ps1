$servisi = Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' }

if ($null -eq $servisi) {
    Write-Output "Atrasto servisu skaits: 0"
}
else {
    $servisi
}