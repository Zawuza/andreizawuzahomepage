unit dao;

interface

uses XSuperObject;

type
  TDataAccessObject = class
    function GetBlogs: ISuperObject;
  end;

implementation

function TDataAccessObject.GetBlogs: ISuperObject;
var i: integer;
begin
  Result := SO;
  for i:=0 to 0 do
  with Result.A['posts'].O[i] do
    begin
      S['postname'] := 'Awesome blog post!';
      S['preview'] := 'Awesome preview';
    end;
end;
  
end.