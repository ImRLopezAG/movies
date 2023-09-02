import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/src.dart';

class MovieService {
  static final MovieService _instance = MovieService._internal();
  factory MovieService() => _instance;
  MovieService._internal();

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = EnvKeys.MOVIE_KEY!;

  Future<dynamic> _getDecodedData(
      {required String endpoint, int page = 1, bool search = false}) async {
    final url = Uri.https(
        _baseUrl, '/3/${search ? 'search/movie' : 'movie/$endpoint'}', {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '$page',
      'query': search ? endpoint : null,
    });
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    return decodedData;
  }

  Future<Movies> getNowPlaying() async {
    final jsonData = await _getDecodedData(endpoint: 'now_playing');
    final movies = Movies.fromJson(jsonData);
    return movies;
  }

  Future<Movies> getPopular({int page = 1}) async {
    final jsonData = await _getDecodedData(endpoint: 'popular', page: page);
    final movies = Movies.fromJson(jsonData);
    return movies;
  }

  Future<Movies> getMovieByName({required String name}) async {
    final jsonData = await _getDecodedData(endpoint: name, search: true);
    final movies = Movies.fromJson(jsonData);
    return movies;
  }

  Future<Movies> getTopRated({int page = 1}) async {
    final jsonData = await _getDecodedData(endpoint: 'top_rated', page: page);
    final movies = Movies.fromJson(jsonData);
    return movies;
  }
}
