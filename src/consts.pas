{Unit with constant files}
unit consts;

interface

uses SysUtils;

function PATH_TO_SRC:string;

implementation

function PATH_TO_SRC: string;
var App: string;
begin
  App:=ExtractFilePath(ParamStr(0));
  Delete(App,Pos('\bin',App),Length('\bin'));
  Result:=App;
end;

end.