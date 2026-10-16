$os = Get-CimInstance -ClassName Win32_OperatingSystem
Write-Output "Datora nosaukums: $env:COMPUTERNAME"
Write-Output "Operetajsistemas nosaukums: $($os.Caption)"
Write-Output "Buvejuma numurs: $($os.BuildNumber)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Datums un laiks: $(Get-Date)"
Write-Output "Procesu skaits: $((Get-Process).Count)"