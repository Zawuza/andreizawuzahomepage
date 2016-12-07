{
  Unit with factory for static content
}
unit staticfactory;

interface    

uses consts, Classes, SysUtils;                                                                      

type

TStaticFactory = class
  class function GetStaticContentStream(AFileName: string): TStream;
end;

implementation

class function TStaticFactory.GetStaticContentStream(AFileName: string): TStream;
begin
  if not (AFileName[1]='\') then
    AFileName:='\' + AFileName;
  Result:=TFIleStream.Create(PATH_TO_SRC + AFileName,fmOpenRead);
end;

end.