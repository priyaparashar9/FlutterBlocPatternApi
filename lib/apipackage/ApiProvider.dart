import 'dart:async';
import 'package:bloc_demo/model/HomePageModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "https://jsonplaceholder.typicode.com";

class ApiProvider {

  static final ApiProvider _apiProvider= ApiProvider._internal();

  factory ApiProvider()
  {
    return _apiProvider;
  }

   Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

   Future getBeers()
  {return http.get("https://api.punkapi.com/v2/beers");
  }


  ApiProvider._internal();
}
