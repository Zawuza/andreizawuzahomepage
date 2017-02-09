Try {
Get-Process main -ErrorAction Stop | Stop-Process 
Write-Output "Process is stopped"
}
Catch [Microsoft.PowerShell.Commands.ProcessCommandException]{
  Write-Output "Process is not found: nothing is stopped"
}
Catch {
  Write-Output "Unknown exception"
}
Start-Process .\src\bin\main.exe | Out-File .\log.log