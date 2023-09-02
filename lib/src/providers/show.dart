import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';

class ShowProvider with ChangeNotifier {
  final _service = ShowService();
  ShowProvider() {
    loadInitialShows();
  }

  List<Movie> _onDisplayShows = [];
  List<Movie> _popularShows = [];

  List<Movie> get onDisplayShows => _onDisplayShows;
  List<Movie> get popularShows => _popularShows;
  int _popularPage = 1;
  
  Future loadInitialShows() async {
    _onDisplayShows = await _service.getTopRated().then((movies) => movies.results!);
    _popularShows = await _service.getPopular().then((movies) => movies.results!);
    notifyListeners();
  }

  Future infinitePopular() async {
    _popularPage++;
    final popular = await _service.getPopular(page: _popularPage);
    _popularShows = [..._popularShows, ...popular.results!];
    notifyListeners();
  }
}
