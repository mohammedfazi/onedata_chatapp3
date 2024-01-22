class User{
  int?id;
  String?fullname;

  userMap(){
    var mapping=Map<String,dynamic>();
    mapping['id']=id??null;
    mapping['fullname']=fullname!;
    return mapping;
  }
}