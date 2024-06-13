import 'package:ghibliapi/models/anime_model.dart';

class AnimeModel {
  final String id;
  final String title;
  final String original_title;
  final String original_title_romanised;
  final String running_time;
  final String director;
  final String producer;
  final String image;
  final String movie_banner;
  final String description;
  final String release_date;
  final String rt_score;

  AnimeModel({
    required this.id,
    required this.title,
    required this.original_title,
    required this.original_title_romanised,
    required this.running_time,
    required this.director,
    required this.producer,
    required this.image,
    required this.movie_banner,
    required this.description,
    required this.release_date,
    required this.rt_score,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
        id: json['id'] ,
        title: json['title'],
        original_title: json['original_title'],
        original_title_romanised: json['original_title_romanised'],
        running_time: json['running_time'],
        director: json['director'],
        producer: json['producer'],
        image: json['image'],
        movie_banner: json['movie_banner'],
        description: json['description'],
        release_date: json['release_date'],
        rt_score: json['rt_score'],
    );
  }
}
