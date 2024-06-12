import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AnimeModel extends ChangeNotifier {
  List<Map<String,dynamic>> _decodedAni = [];
  List get decodedAni => _decodedAni;
  Future animes() async{
    var response = await http.get(Uri.parse('https://ghibliapi.vercel.app/films'));
    var decodedAnimes = jsonDecode(response.body);
    if(response.statusCode == 200){
      for(var i = 0; i < decodedAnimes.length; i++){
        _decodedAni.add({
          'id': decodedAnimes[i]['id'],
          'title': decodedAnimes[i]['title'],
          'image': decodedAnimes[i]['image'],
          'movie_banner': decodedAnimes[i]['movie_banner'],
          'rt_score': decodedAnimes[i]['rt_score'],
        });
      }
    }else{
      return Exception("Couldn't Load");
    }
    notifyListeners();
  }

}