import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';

class CastProvider with ChangeNotifier {
  final _service = CastService();
  final Map<int, List<Cast>> _cast = {};

  Future<List<Cast>> getCast(int movieId) async {
    if (_cast.containsKey(movieId)) return _cast[movieId]!;
    final credits = await _service.getCredits(movieId);
    _cast[movieId] = credits.cast!;
    return credits.cast!;
  }
}
