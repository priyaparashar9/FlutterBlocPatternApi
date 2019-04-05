import 'dart:convert';

import 'package:bloc_demo/apipackage/ApiProvider.dart';
import 'package:bloc_demo/model/HomePageModel.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocBase {
  void dispose();
}

class UserBloc extends BlocBase {
  final _fetchUserData = PublishSubject<List<UserListModel>>();
  Observable<List<UserListModel>> get getUserList => _fetchUserData.stream;

  var apiProvider = ApiProvider();
  var users = new List<UserListModel>();

  getUsers() {
    apiProvider.getUsers().then((response) {
      Iterable list = json.decode(response.body);
      users = list.map((model) => UserListModel.fromJson(model)).toList();
      if (users.length > 0)
        _fetchUserData.sink.add(users);
      else
        _fetchUserData.sink.addError("No Data Found");
    });
    ;
  }

  @override
  void dispose() {
    _fetchUserData.close();
  }
}

final userBloc = UserBloc();
