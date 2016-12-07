unit pagefactory;

interface

uses SysUtils, Classes, consts, SynMustache, SynCommons;

type
  TPageFactory = class
    class function IndexPage: string;
  end;

implementation

{TPageFactory}

class function TPageFactory.IndexPage: string;
var buf: TStringList;
    mustache: TSynMustache;
    doc: Variant;
begin
  buf:=TStringList.Create;
  buf.LoadFromFile(PATH_TO_SRC + '\html\index.html');
  mustache:=TSynMustache.Parse(buf.Text);
  TDocVariant.New(doc);
  buf.LoadFromFile(PATH_TO_SRC + '\html\head.html');
  doc.head:=buf.Text;
  buf.LoadFromFile(PATH_TO_SRC + '\html\navbar.html');
  doc.navbar:=buf.Text;
  Result:=mustache.Render(doc);
  buf.Text:=Result;
  buf.SaveToFile('C:\Prog\lol.html');
  FreeAndNil(buf);
end;

end.