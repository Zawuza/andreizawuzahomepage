program andreizawuzawebsite;

uses SysUtils, djServer, djWebAppContext, bloglsresource, indexdefaulthandler, djInterfaces,
     djHandlerList, blogarchiveresource;

procedure Main;
var Server: TdjServer;
    BlogContext: TdjWebAppContext;
    IndexPageHandler: IHandler;
    HandlerContaner: TdjHandlerList;
    LocalIp: string;
begin
   LocalIp:=GetEnvironmentVariable('LOCAL_IP');
   if LocalIp = '' then
      Server:=TdjServer.Create(80)
   else  
      Server:=TdjServer.Create(LocalIp,80);
   try
      //Add default handler
      IndexPageHandler := TIndexDefaultHandler.Create;
      HandlerContaner:=TdjHandlerList.Create;
      HandlerContaner.AddHandler(IndexPageHandler);
      Server.AddHandler(HandlerContaner);

      //Add blog context
      BlogContext := TdjWebAppContext.Create('blog');
      BlogContext.Add(TBlogListResource, '/ls');
      BlogContext.Add(TBlogArchiveResource,'/archive/*');
      Server.Add(BlogContext);

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
