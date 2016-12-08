unit indexdefaulthandler;

interface

uses SysUtils, djAbstractHandler, homepage, djServerContext, djTypes,
     djHTTPConstants, staticfactory;

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
  try
    //homepage
    if Request.Document = '/' then
      begin
        Response.ContentText:=THomepage.Get;
        Response.ContentType:='text/html';
        Response.ResponseNo:=HTTP_OK;
      end;
    //my photo
    if Request.Document = '/face.jpg' then
      begin
        Response.ContentType:='image/jpg';
        Response.ResponseNo:=HTTP_OK;
        Response.ContentStream:=TStaticFactory.GetStaticContentStream('img\face.jpg');
      end;
    //blog -> redirect
    if Request.Document = '/blog' then
      begin
        Response.Location:='/blog/ls';
        Response.ResponseNo:=301;
      end;
  except
   on e: Exception do 
       begin
         Response.ResponseNo:=500;
         Writeln('FAIL AT REQUEST TO:', Request.Document);
         Writeln(e.ClassName);
         Writeln(e.Message);
       end;
  end;
end;

end.