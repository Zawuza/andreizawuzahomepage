Set-Location .\src
if (!(Test-Path -Path ".\out")) {
    New-Item -ItemType directory -Path ".\out" | Out-Null
}
if (!(Test-Path -Path ".\bin")) {
    New-Item -ItemType directory -Path ".\bin" | Out-Null
}
$out = fpc main.pas -Mdelphi -Fu".\dep\daraja-framework" `
   -Fu".\dep\indy\Core" -Fu".\dep\indy\Protocols" -Fu".\dep\indy\System" `
   -Fu".\dep\dmustache" -Fu".\dep\lcl" -FU".\out" -o".\bin\main.exe" | Out-String
if ($out.Contains('Error')) {
    Write-Output "---FAIL----There are errors!!!------------------------"
    Write-Output $out
    Set-Location ..
    exit;
}
Set-Location ..
.\src\bin\main.exe