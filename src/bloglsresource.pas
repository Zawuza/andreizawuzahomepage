unit bloglsresource;

interface

uses djWebComponent, IdCustomHTTPServer, Classes, SysUtils;

type
    TBlogListResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

    procedure TBlogListResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
    var Header: TStringList;
        Navbar: TStringList;
    begin
      Header := TStringList.Create;
      Navbar := TStringList.Create;
      Header.LoadFromFile(PATH_TO_SRC + '/html/head.html');
      Navbar.LoadFromFile(PATH_TO_SRC + 'html/navbar.html');
      
      FreeAndNil(Header);
      FreeAndNil(Navbar);
    end;

end.