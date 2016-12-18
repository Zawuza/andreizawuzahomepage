cd .\src
$out = fpc main.pas -Mdelphi -Fu".\dep\daraja-framework" `
   -Fu".\dep\indy\Core" -Fu".\dep\indy\Protocols" -Fu".\dep\indy\System" `
   -Fu".\dep\dmustache" -Fu".\dep\x-superobject" -FU".\out" -o".\bin\main.exe" | Out-String
if ($out.Contains('Error')) {
    Write-Output "---FAIL----There are errors!!!------------------------"
    Write-Output $out
    cd ..
    exit;
}
cd ..
.\src\bin\main.exe