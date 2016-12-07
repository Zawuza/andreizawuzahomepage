unit firstresource;

interface

uses djWebComponent, IdCustomHTTPServer;

type
    TDefualtResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

    procedure TDefualtResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
    begin
      Response.ContentText:='Yep!';
      Response.ContentType:='text/plain';
    end;

end.