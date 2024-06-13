
import 'dart:convert';

import 'package:ghibliapi/models/anime_model.dart';
import 'package:http/http.dart' as http;

class AnimeService{
  var baseUrl = 'https://ghibliapi.vercel.app/films';
  Future<List<AnimeModel>> getAnimes() async{
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      final decodedData = jsonDecode(response.body) as List;
      print(decodedData);
      return decodedData.map((film)=>AnimeModel.fromJson(film)).toList();
    }else{
      throw Exception("Something Went Wrong !!");
    }
  }
}