unit dao;

interface

uses fpjson, jsonparser, Classes, SysUtils, Consts;

type
    TDataAccessObject = class
    class function GetBlogs: TJSONData;
  end;
 
implementation


class function TDataAccessObject.GetBlogs: TJSONData;
var PostsJSON:TStringList;
begin
  PostsJSON:=TStringList.Create;
  PostsJSON.LoadFromFile(PATH_TO_SRC + '\posts\posts.json');
  Result:=GetJSON(PostsJSON.Text);
  FreeAndNil(PostsJSON);
end;
  
end.