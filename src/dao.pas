unit dao;

interface

uses fpjson;

type
  TDataAccessObject = class
    class function GetBlogs: TJSONData;
  end;

implementation

//Sample JSON object:
//{"posts":[{
//            "postid": "awesome",
//            "postname":"Awesome post",
//            "preview":"This is awesome post about all things in this world"
//          }]
//}
class function TDataAccessObject.GetBlogs: TJSONData;
var Post: TJSONObject;
    Root: TJSONObject;
    Posts: TJSONArray;
begin
  {Create JSON parts}
  Post:=TJSONObject.Create;
  Root:=TJSONObject.Create;
  Posts:=TJSONArray.Create;

  {Create a post}
  Post.Add('postid','awesome');
  Post.Add('postname','Awesome post!');
  Post.Add('preview','This is awesome post about all things in this world!');

  {Add post to array}
  Posts.Add(Post);

  {Add array to root}
  Root.Add('posts',Posts);
  Result:=Root;
end;
  
end.