{
  Unit with factory for static content
}
unit staticfactory;

interface    

uses consts, Classes, SysUtils, fgl, IdCustomHTTPServer;                                                                      

type

TStaticFactory = class
  class function GetStaticContentStream(AFileName: string;var Response: TIdHTTPResponseInfo): TStream;
  class function FileExists(AFileName: string): boolean;
end;

TStaticFile = class
  private
  FPath: string;
  FContentType: string;
  public
  constructor Create(APath, AContentType: string);
  property Path: string read FPath write FPath;
  property ContentType: string read FContentType write FContentType;
end;

implementation

var AllowedFiles: TFPGMap<string,TStaticFile>;

class function TStaticFactory.GetStaticContentStream(AFileName: string;var Response: TIdHTTPResponseInfo): TStream;
var LFileName,LContentType:string;
begin
  if not FileExists(AFileName) then
     exit;
  LFileName:=AllowedFiles[AFileName].Path;
  LContentType:=AllowedFiles[AFileName].ContentType;
  if not (LFileName[1]='\') then
    AFileName:='\' + AFileName;
  Response.ContentType:=LContentType;
  Writeln(PATH_TO_SRC + LFileName);
  Result:=TFileStream.Create(PATH_TO_SRC + LFileName,fmOpenRead);
end;

class function TStaticFactory.FileExists(AFileName: string): boolean;
begin
  Result:=AllowedFiles.IndexOf(AFileName)<>-1;
end;

{TStaticFile}

constructor TStaticFile.Create(APath, AContentType: string);
begin
  Path:=APath;
  ContentType:=AContentType;
end;

initialization

AllowedFiles:=TFPGMap<string,TStaticFile>.Create; 

{Add allowed files to dictionary}
AllowedFiles.Add('/face.jpg',TStaticFile.Create('img\face.jpg','image/jpeg'));
AllowedFiles.Add('/navbar.css',TStaticFile.Create('css\navbar.css','text/css'));
AllowedFiles.Add('/favicon.ico',TStaticFile.Create('favicon.ico','image/ico'));

finalization

FreeAndNil(AllowedFiles);

end.