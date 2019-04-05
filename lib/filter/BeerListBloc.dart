import 'dart:convert';

import 'package:bloc_demo/apipackage/ApiProvider.dart';
import 'package:bloc_demo/home/bloc/UserBloc.dart';
import 'package:bloc_demo/model/BeerModel.dart';
import 'package:bloc_demo/model/HomePageModel.dart';
import 'package:rxdart/rxdart.dart';



class BeerBloc extends BlocBase {
  final _fetchBeerData = PublishSubject<List<BeerListmodel>>();
  Observable<List<BeerListmodel>> get getBeerList => _fetchBeerData.stream;

  var apiProvider = ApiProvider();
  var beers = new List<BeerListmodel>();

  getBeerLists() {
    apiProvider.getBeers().then((response) {
      Iterable list = json.decode(response.body);
      beers = list.map((model) => BeerListmodel.fromJson(model)).toList();
      if (beers.length > 0)
        _fetchBeerData.sink.add(beers);
      else
        _fetchBeerData.sink.addError("No Data Found");
    });
    ;
  }

  @override
  void dispose() {
    _fetchBeerData.close();
  }
}

final beerBloc = BeerBloc();
