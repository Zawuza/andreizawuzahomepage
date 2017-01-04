{
  Unit with factory for static content
}
unit staticfactory;

interface    

uses consts, Classes, SysUtils;                                                                      

type

TStaticFactory = class
  class function GetStaticContentStream(AFileName: string): TStream;
  class function FileExists(AFileName: string): boolean;
end;

implementation

class function TStaticFactory.GetStaticContentStream(AFileName: string): TStream;
begin
  if not (AFileName[1]='\') then
    AFileName:='\' + AFileName;
  Result:=TFIleStream.Create(PATH_TO_SRC + AFileName,fmOpenRead);
end;

class function TStaticFactory.FileExists(AFileName: string): boolean;
begin
  Result:=false;
  if AFilename='/face.jpg' then Result:=true;
end;

end.