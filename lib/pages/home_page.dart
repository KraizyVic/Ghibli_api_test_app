import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ghibliapi/pages/details_page.dart';
import 'package:ghibliapi/util/anime_tile.dart';
import 'package:http/http.dart' as http ;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String,dynamic>> decodedAni = [];

  Future animes() async{
    var response = await http.get(Uri.parse('https://ghibliapi.vercel.app/films'));
    var decodedAnimes = jsonDecode(response.body);
    if(response.statusCode == 200){
      for(var i = 0; i < decodedAnimes.length; i++){
        decodedAni.add({
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,//Colors.grey[200],
      body: FutureBuilder(
        future: animes(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: CarouselSlider(
                      items: decodedAni.map((i){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                filmId: i['id'],
                              ),
                            ),
                            );
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  '${i['movie_banner']}',
                                  fit: BoxFit.cover,
                                  height: double.maxFinite,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black,Colors.transparent],
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i['title'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,color: Colors.yellow,),
                                        Text(i['rt_score'])
                                      ],
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Text(
                        "Ghibli Animes",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: decodedAni.length,
                      itemBuilder: (context,index){
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                filmId: decodedAni[index]['id'],
                              ),
                            )
                            );
                          },
                          child: AnimeTile(
                            animePoster: decodedAni[index]['image'],
                            animeName: decodedAni[index]['title'],
                          ),
                        );
                      }
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Text(
                        "More Ghibli Animes",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: decodedAni.length,
                      itemBuilder: (context,index){
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                filmId: decodedAni[index]['id'],
                              ),
                            )
                            );
                          },
                          child: AnimeTile(
                            animePoster: decodedAni[index]['image'],
                            animeName: decodedAni[index]['title'],
                          ),
                        );
                      }
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
        },
      ),
    );
  }
}
