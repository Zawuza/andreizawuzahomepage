cd .\src
fpc main.pas -Fu".\dep\daraja-framework" -Fu".\dep\indy\Core" -Fu".\dep\indy\Protocols" -Fu".\dep\indy\System" -FU".\out" -o".\bin\main.exe"
cd ..
.\src\bin\main.exe