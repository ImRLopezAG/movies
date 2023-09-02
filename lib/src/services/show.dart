import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/src/src.dart';

class ShowService {
  static final ShowService _instance = ShowService._internal();
  factory ShowService() => _instance;
  ShowService._internal();

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = EnvKeys.MOVIE_KEY!;

  Future<dynamic> _getDecodedData({required String endpoint, int page = 1}) async {
    final url = Uri.https(_baseUrl, '/3/tv/$endpoint', {
      'api_key': _apiKey,
      'language': 'en-US',
      'page': '$page',
    });
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    return decodedData;
  }

  Future<Movies> getTopRated({int page = 1}) async {
    final jsonData = await _getDecodedData(endpoint: 'top_rated', page: page);
    final shows = Movies.fromJson(jsonData);
    return shows;
  }

  Future<Movies> getPopular({int page = 1}) async {
    final jsonData = await _getDecodedData(endpoint: 'popular', page: page);
    final shows = Movies.fromJson(jsonData);
    return shows;
  }
}
