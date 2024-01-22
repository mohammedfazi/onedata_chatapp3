class Userjob{
  int?id;
  String?name;


  userMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['name']=name!;
    return mapping;

  }
}