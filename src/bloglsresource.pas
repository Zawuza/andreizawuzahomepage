unit bloglsresource;

interface

uses djWebComponent, IdCustomHTTPServer, Classes, SysUtils, XSuperObject, dao, SynMustache;

type
    TBlogListResource = class(TdjWebComponent)
      procedure OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo); override;
    end;

implementation

    procedure TBlogListResource.OnGet(Request: TIdHTTPRequestInfo; Response: TIdHTTPResponseInfo);
    var Header: TStringList;
        Navbar: TStringList;
        Template: TStringList;
        JSON: ISuperObject;
        var i: integer;
        HTML: string;
        mustache: TSynMustache;
    begin
      {Allocate memmory}
      Header := TStringList.Create;
      Navbar := TStringList.Create;
      Template:=TStringList.Create;
      try
      Header.LoadFromFile(PATH_TO_SRC + '/html/head.html');
      Navbar.LoadFromFile(PATH_TO_SRC + 'html/navbar.html');
      
      {Become posts}
      JSON := TDataAccessObject.GetBlogs;
      {Add navbar and headre to JSON}
      JSON.S['header']:=Header.Text;
      JSON.S['navbar']:=Navbar.Text;

      {Prepare the template}
      Template.LoadFromFile(PATH_TO_SRC + '/html/blog.html');
      mustache:=TSynMustache.Parse(Template.Text);
      HTML:=mustache.RenderJSON(JSON.AsJSON);

      Reponse.ContentType:='/text/html';
      Response.ContentText:=HTML;
      Response.ResponseNo:=HTTP_OK;

      finally
      FreeAndNil(Template);
      FreeAndNil(Header);
      FreeAndNil(Navbar);
      end;
    end;

end.