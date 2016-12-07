{
  Unit with generator of index page (homepage)
}
unit homepage;

interface

uses SysUtils, Classes, consts, SynMustache, SynCommons;

type
  THomepage = class
    class function Get: string;
  end;

implementation

{THomepage}

class function THomepage.Get: string;
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
  FreeAndNil(buf);
end;

end.