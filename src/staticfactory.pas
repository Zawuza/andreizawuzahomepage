{
  Unit with factory for static content
}
unit staticfactory;

interface    

uses consts, Classes, SysUtils, fgl;                                                                      

type

TStaticFactory = class
  class function GetStaticContentStream(AFileName: string): TStream;
  class function FileExists(AFileName: string): boolean;
end;

implementation

var AllowedFiles: TFPGMap<string,boolean>;

class function TStaticFactory.GetStaticContentStream(AFileName: string): TStream;
begin
  if not (AFileName[1]='\') then
    AFileName:='\' + AFileName;
  if FileExists(AFileName) then
     Result:=TFIleStream.Create(PATH_TO_SRC + AFileName,fmOpenRead);
end;

class function TStaticFactory.FileExists(AFileName: string): boolean;
begin
  Result:=AllowedFiles.IndexOf(AFileName)<>-1;
end;

initialization

AllowedFiles:=TFPGMap<string,boolean>.Create; 

{Add allowed files to dictionary}
AllowedFiles.Add('/face.jpg',true);

finalization

FreeAndNil(AllowedFiles);

end.