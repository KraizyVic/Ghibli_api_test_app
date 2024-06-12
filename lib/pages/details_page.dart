import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DetailsPage extends StatelessWidget {
  final String filmId;
  DetailsPage({
    super.key,
    required this.filmId,
  });

  Map<String,dynamic> movieDetailsList = {
    'title':'',
    'original_title' : '',
    'original_title_romanised' : '',
    'running_time' : '',
    'director' : '',
    'producer' : '',
    'image' : '',
    'movie_banner' : '',
    'description' : '',
    'release_date' : '',
    'rt_score' : '',
  };

  Future getAnimeData()async{
    var response = await http.get(
        Uri.parse('https://ghibliapi.vercel.app/films/$filmId'),
    );
    if(response.statusCode == 200){
      var decodedJson = jsonDecode(response.body);
      movieDetailsList['title'] = decodedJson['title'];
      movieDetailsList['original_title'] = decodedJson['original_title'];
      movieDetailsList['original_title_romanised'] = decodedJson['original_title_romanised'];
      movieDetailsList['running_time'] = decodedJson['running_time'];
      movieDetailsList['director'] = decodedJson['director'];
      movieDetailsList['producer'] = decodedJson['producer'];
      movieDetailsList['image'] = decodedJson['image'];
      movieDetailsList['movie_banner'] = decodedJson['movie_banner'];
      movieDetailsList['description'] = decodedJson['description'];
      movieDetailsList['release_date'] = decodedJson['release_date'];
      movieDetailsList['rt_score'] = decodedJson['rt_score'];
    }else{
      throw Exception("Error Fetching Specific Anime");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: FutureBuilder(
        future: getAnimeData(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: Stack(
                      children: [
                        Image.network(
                          movieDetailsList['movie_banner'],
                          fit: BoxFit.cover,
                          height: double.maxFinite,
                          width: double.maxFinite,
                        ),
                        Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black,Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            )
                          ),
                        ),
                        Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,//Colors.blue.withOpacity(0.4),
                              foregroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieDetailsList['title'],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                    Icons.star,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  movieDetailsList['rt_score'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text(
                            "Original Title: ${movieDetailsList['original_title']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                            "Romanised Title: ${movieDetailsList['original_title_romanised']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Release Date: ${movieDetailsList['release_date']}",
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          "Running Time: ${movieDetailsList['running_time']}",
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          "Director: ${movieDetailsList['director']}",
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          "Producer: ${movieDetailsList['producer']}",
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                        const SizedBox(height: 15,),
                        const Text(
                          "Description: ",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                        Text(
                          movieDetailsList['description'],
                          style: const TextStyle(
                              fontSize: 16,
                            letterSpacing: 1.5
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}
