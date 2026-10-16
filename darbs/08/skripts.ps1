$laiks1 = Measure-Command { Get-Service -Name "Spooler" }
$laiks2 = Measure-Command { Get-CimInstance -ClassName Win32_Service -Filter "Name='Spooler'" }

Write-Output "1. veida laiks (milisekundes): $($laiks1.TotalMilliseconds)"
Write-Output "2. veida laiks (milisekundes): $($laiks2.TotalMilliseconds)"

if ($laiks1.TotalMilliseconds -lt $laiks2.TotalMilliseconds) {
    Write-Output "Secinajums: Atraks bija pirmais veids (Get-Service)."
}
else {
    Write-Output "Secinajums: Atraks bija otrais veids (Get-CimInstance)."
}