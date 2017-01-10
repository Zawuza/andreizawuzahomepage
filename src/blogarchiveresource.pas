{Resource for page with blog post}
unit blogarchiveresource;

{$mode objfpc}

interface

uses djWebComponent, IdCustomHTTPServer, consts, Classes, SysUtils, SynMustache, SynCommons;

type
    TBlogArchiveResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;


    TBlogPostText = record
      Rus: string;
      Ger: string;
      Eng: string;
    end;

    function GetBlogById(Id:string): TBlogPostText;

implementation

procedure TBlogArchiveResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
var Navbar: TStringList;
    Header: TStringList;
    buf: TStringList;
    mustache: TSynMustache;
    doc: Variant;
    BlogPost: TBlogPostText;
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
   BlogPost:=GetBlogById('NOT IMPLEMENTED');
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


function GetBlogById(Id: string): TBlogPostText;
begin
  Result.Rus:='<h1>Привет</h1>';
  Result.Ger:='<h1>Hallo</h1>';
  Result.Eng:='<h1>Hello</h1>';
end;

end.