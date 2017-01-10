program andreizawuzahomepage;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, LazUTF8, SysUtils, djServer, djWebAppContext, bloglsresource, indexdefaulthandler, djInterfaces,
  djHandlerList, blogarchiveresource;

{$R *.res}

var Server: TdjServer;
    BlogContext: TdjWebAppContext;
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

      //Add blog context
      BlogContext := TdjWebAppContext.Create('blog');
      BlogContext.Add(TBlogListResource, '/ls');
      BlogContext.Add(TBlogArchiveResource,'/archive/*');
      Server.Add(BlogContext);

      Server.Start;
      while true do;
   finally
     FreeAndNil(Server);
   end;
end.

