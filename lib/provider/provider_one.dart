import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:listingproject/DataModel/movie_model.dart';

class ProviderOne extends ChangeNotifier {
  var res;
  List<MovieModel> movieList = [];

  void apiTest() async {
    var url = Uri.parse('https://api.androidhive.info/json/movies.json');
    var response = await http.get(url);
    res = jsonDecode(response.body);
    for(int i=0;i<res.length;i++){
      movieList.add(MovieModel.fromJson(res[i]));
    }
    notifyListeners();
  }
}
