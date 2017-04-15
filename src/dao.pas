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
    FilePath: string;
begin
  Result.LoadFailed:=true;
  FilePath:=PATH_TO_SRC + '/posts/';
  if LowerCase(Id)='posts'then
    exit;
  StrPost:=TStringList.Create;
  try
  StrPost.LoadFromFile(FilePath + Id +'/' + Id + '_en.html');
  Result.Eng:=StrPost.Text;
  StrPost.LoadFromFile(FilePath + Id + '/' + Id + '_de.html');
  Result.Ger:=StrPost.Text;
  StrPost.LoadFromFile(FilePath + Id + '/' + Id + '_ru.html');
  Result.Rus:=StrPost.Text;
  Result.LoadFailed:=false;
  finally
    FreeAndNil(StrPost);
  end;
end;

  
end.