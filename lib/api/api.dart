import 'dart:convert';

import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _nowplayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.ApiKey}';
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.ApiKey}';

  Future<List<Movie>> getNowPlaying() async {
    final response = await http.get(Uri.parse(_nowplayingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // final json = '[${response.body}]';
      // List nowplaying = (jsonDecode(json) as List<dynamic>);
      return decodedData
          .map((nowplaying) => Movie.fromJson(nowplaying))
          .toList();
    } else {
      throw Exception('something happen');
    }
  }

  Future<List<Movie>> getPopular() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // final json = '[${response.body}]';
      // List nowplaying = (jsonDecode(json) as List<dynamic>);
      return decodedData
          .map((nowplaying) => Movie.fromJson(nowplaying))
          .toList();
    } else {
      throw Exception('something happen');
    }
  }

  Future<List<Movie>> getRecommendation(int movieid) async {
    final url =
        'https://api.themoviedb.org/3/movie/$movieid/recommendations?language=en-US&page=1';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      // final json = '[${response.body}]';
      // List nowplaying = (jsonDecode(json) as List<dynamic>);
      return decodedData
          .map((nowplaying) => Movie.fromJson(nowplaying))
          .toList();
    } else {
      throw Exception('something happen');
    }
  }
}
