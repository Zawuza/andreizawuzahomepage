Set-Location .\src
$out = fpc main.pas -Mdelphi -Fu".\dep\daraja-framework" `
   -Fu".\dep\indy\Core" -Fu".\dep\indy\Protocols" -Fu".\dep\indy\System" `
   -Fu".\dep\dmustache" -FU".\out" -o".\bin\main.exe" | Out-String
if ($out.Contains('Error')) {
    Write-Output "---FAIL----There are errors!!!------------------------"
    Write-Output $out
    Set-Location ..
    exit;
}
Set-Location ..
.\src\bin\main.exe