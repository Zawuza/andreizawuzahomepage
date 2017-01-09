{Resource for page with blog post}
unit blogarchiveresource;

interface

uses djWebComponent, IdCustomHTTPServer, consts, Classes, SysUtils;

type
    TBlogArchiveResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

procedure TBlogArchiveResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
var Navbar: TStringList;
    Header: TStringList;
begin
   Navbar := TStringList.Create;
   Header := TSTringList.Create;
   FreeAndNil(Navbar);
   FreeAndNil(Header);
end;

end.