unit dao;

interface

uses fpjson, jsonparser, Classes, SysUtils, Consts;

type

  TBlogPostText = record
      Rus: string;
      Ger: string;
      Eng: string;
      LoadFailed: boolean;
  end;

  TDataAccessObject = class
    class function GetLatestBlogs: TJSONData;
    class function GetBlogById(Id: string): TBlogPostText;
  end;
 
implementation


class function TDataAccessObject.GetLatestBlogs: TJSONData;
var PostsJSON:TStringList;
begin
  PostsJSON:=TStringList.Create;
  PostsJSON.LoadFromFile(PATH_TO_SRC + '\posts\posts.json');
  Result:=GetJSON(PostsJSON.Text);
  FreeAndNil(PostsJSON);
end;

class function TDataAccessObject.GetBlogById(Id: string): TBlogPostText;
var StrPost: TStringList;
    FileName: string;
    JSONPost: TJSONObject;
begin
  FileName:=PATH_TO_SRC + '/posts/' + Id + '.json';
  Result.LoadFailed:=true;
  if LowerCase(Id)='posts'then
    exit;
  if not FileExists(Filename) then
    exit;
  StrPost:=TStringList.Create;
  try
  StrPost.LoadFromFile(FileName);
  JSONPost:=(GetJSON(StrPost.Text) as TJSONObject);
  Result.Eng:=JSONPost['english'].AsString;
  Result.Ger:=JSONPost['german'].AsString;
  Result.Rus:=JSONPost['russian'].AsString;
  Result.LoadFailed:=false;
  finally
    FreeAndNil(StrPost);
    FreeAndNil(JSONPost);
  end;
end;

  
end.