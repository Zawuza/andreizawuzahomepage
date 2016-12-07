program andreizawuzawebsite;

uses SysUtils, djServer, djWebAppContext, firstresource, indexdefaulthandler, djInterfaces,
     djHandlerList;

procedure Main;
var Server: TdjServer;
    Context: TdjWebAppContext;
    IndexPageHandler: IHandler;
    HandlerContaner: TdjHandlerList;
begin
   Server:=TdjServer.Create(5000);
   try
      //Add default handler
      IndexPageHandler := TIndexDefaultHandler.Create;
      HandlerContaner:=TdjHandlerList.Create;
      HandlerContaner.AddHandler(IndexPageHandler);
      Server.AddHandler(HandlerContaner);

      // Context := TdjWebAppContext.Create('index');
      // Context.Add(TDefualtResource, '/*');
      // Server.Add(Context);

      Server.Start;
      WriteLn('Server is running');
      while true do;
   finally
     FreeAndNil(Server);
   end;
end;

begin
  Main;
end.