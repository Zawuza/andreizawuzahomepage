{Resource for page with blog post}
unit blogarchiveresource;

interface

uses djWebComponent, IdCustomHTTPServer, consts, Classes, SysUtils, SynMustache, SynCommons, lazutf8classes;

type
    TBlogArchiveResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

procedure TBlogArchiveResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
var Navbar: TStringListUTF8;
    Header: TStringListUTF8;
    buf: TStringListUTF8;
    mustache: TSynMustache;
    doc: Variant;
begin
   {Create resources}
   Navbar := TStringListUTF8.Create;
   Header := TStringListUTF8.Create;
   buf:=TStringListUTF8.Create;
   {Prepare files}
   Navbar.LoadFromFile(PATH_TO_SRC + '\html\navbar.html');
   Header.LoadFromFile(PATH_TO_SRC + '\html\head.html');
   buf.LoadFromFile(PATH_TO_SRC + '\html\archive.html');
   Writeln(buf.Text);
   {Generate html}
   mustache:=TSynMustache.Parse(buf.Text);
   TDocVariant.new(doc);
   doc.head:=Header.Text;
   doc.navbar:=Navbar.Text;
   {Return html}
   Response.ContentText:=mustache.Render(doc);
   Response.ContentType:='text/html';
   Response.ContentEncoding:='utf-8';
   {Free resources}
   FreeAndNil(Navbar);
   FreeAndNil(Header);
   FreeAndNil(buf);
end;

end.