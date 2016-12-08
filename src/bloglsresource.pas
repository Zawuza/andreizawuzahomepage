unit bloglsresource;

interface

uses djWebComponent, IdCustomHTTPServer;

type
    TBlogListResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

    procedure TBlogListResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
    begin
      
    end;

end.