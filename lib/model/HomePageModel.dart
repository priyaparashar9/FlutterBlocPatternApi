import 'package:flutter/material.dart';

class UserListModel{
  int id;
  String name;
  String email;


  UserListModel.fromJson(Map json)
      : id = json['id'],
        name = json['username'],
        email = json['email'];

/*  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }*/

}