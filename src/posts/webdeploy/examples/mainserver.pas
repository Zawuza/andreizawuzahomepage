program mainserver;

{$mode objfpc}

uses Sysutils, Classes, IdHTTPServer, IdCustomHTTPServer, IdContext;

type
    TServer = class
       procedure OnCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    end;

    procedure TServer.OnCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    begin
      if ARequestInfo.Document = '/' then
        begin
          AResponseInfo.ContentType:='text/json';
          case Random(2) of 
          0: begin
            AResponseInfo.ResponseNo:=200;
            AResponseInfo.ContentText:='{"success":true}';
          end;
          1:begin
            AResponseInfo.ResponseNo:=500;
            AResponseInfo.ContentText:='{"success":false}';
          end;
          end;
        end;
    end;

var IdServer: TIdHTTPServer;
    Server: TServer;

begin
  Server := TServer.Create;
  IdServer := TIdHTTPServer.Create;
  IdServer.OnCommandGet:=@Server.OnCommandGet;
  IdServer.Active:=true;
  while true do; 
end.