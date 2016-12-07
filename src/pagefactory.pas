unit pagefactory;

interface

uses SysUtils, Classes, consts;

type
  TPageFactory = class
    class function IndexPage: string;
  end;

implementation

class function TPageFactory.IndexPage: string;
var f: TStringList;
begin
  f:=TStringList.Create;
  try
    f.LoadFromFile(PATH_TO_SRC + '/html/index.html');
  except
  on e: Exception do
    Writeln(e.ClassName, ' ', e.Message);
  end;
  Result:=f.Text;
  FreeAndNil(f);
end;

end.