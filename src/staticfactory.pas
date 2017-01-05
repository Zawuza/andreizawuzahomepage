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

var AllowedFiles: TFPGMap<string,string>;

class function TStaticFactory.GetStaticContentStream(AFileName: string): TStream;
var LFileName:string;
begin
  if not FileExists(AFileName) then
     exit;
  LFileName:=AllowedFiles[AFileName];
  if not (LFileName[1]='\') then
    AFileName:='\' + AFileName;
  Result:=TFIleStream.Create(PATH_TO_SRC + LFileName,fmOpenRead);
end;

class function TStaticFactory.FileExists(AFileName: string): boolean;
begin
  Result:=AllowedFiles.IndexOf(AFileName)<>-1;
end;

initialization

AllowedFiles:=TFPGMap<string,string>.Create; 

{Add allowed files to dictionary}
AllowedFiles.Add('/face.jpg','img\face.jpg');
AllowedFiles.Add('/navbar.css','css\navbar.css');

finalization

FreeAndNil(AllowedFiles);

end.