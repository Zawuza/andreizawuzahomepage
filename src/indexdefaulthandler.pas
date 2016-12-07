unit indexdefaulthandler;

interface

uses djAbstractHandler, pagefactory, djServerContext, djTypes, djHTTPConstants;

type
  TIndexDefaultHandler = class(TdjAbstractHandler)
    procedure Handle(Target: string; Context: TdjServerContext;
      Request: TdjRequest; Response: TdjResponse); override;
  end;

implementation

procedure TIndexDefaultHandler.Handle(Target: string; Context: TdjServerContext;
      Request: TdjRequest; Response: TdjResponse); 
begin
  Writeln('Request to:',Request.Document);
  if Request.Document = '/' then
    begin
    Writeln('Homepage');
    Response.ContentText:=TPageFactory.IndexPage;
    Response.ContentType:='text/html';
    Response.ResponseNo:=HTTP_OK;
    Writeln('Homepage end');
    end;
end;

end.