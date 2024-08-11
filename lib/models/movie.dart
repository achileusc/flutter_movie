// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

class Movie {
  String id;
  List genres;
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.id,
    required this.genres,
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'].toString(),
        title: json['title'],
        backDropPath: json['backdrop_path'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        genres: json['genre_ids']);
  }
}

// class Genre {
//   String id;
//   String name;
//   Genre({
//     required this.id,
//     required this.name,
//   });
//   factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Genre.fromJson(Map<String, dynamic> json) => Genre(
//         id: json['id'],
//         name: json['name'],
//       );
//   Map<String, dynamic> toJson() => {'id': id, 'name': name};
// }
