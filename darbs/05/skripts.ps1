$laiks = (Get-Date).AddHours(-48)
$kludas = Get-WinEvent -FilterHashtable @{ LogName = 'System'; Level = 2; StartTime = $laiks } -ErrorAction SilentlyContinue

if ($null -eq $kludas) {
    Write-Output "Kludu skaits pedejas 48 stundas: 0"
}
else {
    $biezakais = $kludas | Group-Object -Property ProviderName | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Kludu skaits: $($kludas.Count)"
    Write-Output "Biezakais avots: $($biezakais.Name) ($($biezakais.Count) reizes)"
}