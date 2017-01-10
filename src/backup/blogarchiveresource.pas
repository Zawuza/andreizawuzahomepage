{Resource for page with blog post}
unit blogarchiveresource;

{$mode objfpc}

interface

uses djWebComponent, IdCustomHTTPServer, consts, Classes, SysUtils, SynMustache, SynCommons, lazutf8classes, Dialogs;

type
    TBlogArchiveResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

procedure TBlogArchiveResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
var Navbar: TStringList;
    Header: TStringList;
    buf: TStringList;
    mustache: TSynMustache;
    doc: Variant;
begin
   {Create resources}
   Navbar := TStringList.Create;
   Header := TStringList.Create;
   buf:=TStringList.Create;
   {Prepare files}
   Navbar.LoadFromFile(PATH_TO_SRC + '\html\navbar.html');
   Header.LoadFromFile(PATH_TO_SRC + '\html\head.html');
   buf.LoadFromFile(PATH_TO_SRC + '\html\archive.html');
   {Generate html}
   mustache:=TSynMustache.Parse(buf.Text);
   TDocVariant.new(doc);
   doc.head:=Header.Text;
   doc.navbar:=Navbar.Text;
   {Return html}
   Response.ContentText:=mustache.Render(doc);
   ShowMessage(Response.ContentText);
   Response.ContentType:='text/html';
   Response.ContentEncoding:='utf-8';
   Response.CharSet:='UTF-i';
   {Free resources}
   FreeAndNil(Navbar);
   FreeAndNil(Header);
   FreeAndNil(buf);
end;

end.
