{Resource for page with blog post}
unit blogarchiveresource;

{$mode objfpc}

interface

uses djWebComponent, IdCustomHTTPServer, consts, Classes, SysUtils, SynMustache, SynCommons,
dao, RegExpr;

type
    TBlogArchiveResource = class(TdjWebComponent)
    private
      function ExtractBlogId(Path: string): string;
    public
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

function TBlogArchiveResource.ExtractBlogId(Path: string): string;
var RegExpr:TRegExpr;
begin
  RegExpr:=TRegExpr.Create;
  try
  RegExpr.Expression:='\/blog\/archive\/(\w*)';
  if RegExpr.Exec(Path) then
    begin
      Result:=RegExpr.Match[1];
    end;
  finally
    FreeAndNil(RegExpr);
  end;
end;

procedure TBlogArchiveResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
var Navbar: TStringList;
    Header: TStringList;
    buf: TStringList;
    mustache: TSynMustache;
    doc: Variant;
    BlogPost: TBlogPostText;
    PostId: string;
begin
   {Create resources}
   Navbar := TStringList.Create;
   Header := TStringList.Create;
   buf:=TStringList.Create;
   {Prepare html parts}
   Navbar.LoadFromFile(PATH_TO_SRC + '\html\navbar.html');
   Header.LoadFromFile(PATH_TO_SRC + '\html\head.html');
   buf.LoadFromFile(PATH_TO_SRC + '\html\archive.html');
   {Generate html}
   mustache:=TSynMustache.Parse(buf.Text);
   TDocVariant.new(doc);
   doc.head:=Header.Text;
   doc.navbar:=Navbar.Text;
   {Get blog content and add to html}
   PostId:=ExtractBlogId(Request.Document);
   BlogPost:=TDataAccessObject.GetBlogById(PostId);
   if BlogPost.LoadFailed then
     begin
       Response.ResponseNo:=404;
       exit;
     end;
   doc.russian:=BlogPost.Rus;
   doc.german:=BlogPost.Ger;
   doc.english:=BlogPost.Eng;
   {Return html}
   Response.ContentText:=mustache.Render(doc);
   Response.ContentType:='text/html';
   Response.ContentEncoding:='utf-8';
   Response.CharSet:='UTF-8';
   {Free resources}
   FreeAndNil(Navbar);
   FreeAndNil(Header);
   FreeAndNil(buf);
end;



end.