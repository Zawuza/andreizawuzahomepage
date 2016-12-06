program andreizawuzawebsite;

{$mode objfpc} 

uses SysUtils, djServer, djWebAppContext, firstresource;

procedure Main;
var Server: TdjServer;
    Context: TdjWebAppContext;
begin
   Server:=TdjServer.Create(5000);
   try
      Context := TdjWebAppContext.Create('/first');
      Context.Add(TDefualtResource, '/');
      Server.Add(Context);
      Server.Start;
      WriteLn('Server is running, please open http://localhost/first/');
      while true do;
   finally
     FreeAndNil(Server);  
   end;
end;