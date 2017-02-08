try 
{
Get-Process main | Stop-Process 
} 
catch 
{
  Write-Output "main not found"
}
Start-Process .\src\bin\main.exe | Out-File .\log.log