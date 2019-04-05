class BeerListmodel{
int id;
String name;
String imgUrl;
String des;


BeerListmodel.fromJson(Map json):
    id=json['id'],
name=json['name'],
imgUrl=json['image_url'],
des=json['description'];



/*UserListModel.fromJson(Map json)
    : id = json['id'],
      name = json['username'],
      email = json['email'];

Map toJson() {
  return {'id': id, 'name': name, 'email': email};
}*/

}