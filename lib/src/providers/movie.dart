import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';

class MovieProvider with ChangeNotifier {
  final _service = MovieService();
  MovieProvider() {
    loadInitialMovies();
  }

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController<List<Movie>>.broadcast();

  final Debouncer _debouncer =
      Debouncer(duration: const Duration(milliseconds: 500));

  List<Movie> _onDisplayMovies = [];
  List<Movie> _popularMovies = [];

  List<Movie> get onDisplayMovies => _onDisplayMovies;
  List<Movie> get popularMovies => _popularMovies;
  int _popularPage = 1;
  final Map<int, List<Movie>> _searchedMovies = {};

  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  Future loadInitialMovies() async {
    _onDisplayMovies =
        await _service.getNowPlaying().then((movies) => movies.results!);
    _popularMovies =
        await _service.getPopular().then((movies) => movies.results!);
    notifyListeners();
  }

  Future infinitePopular() async {
    _popularPage++;
    final popular = await _service.getPopular(page: _popularPage);
    _popularMovies = [..._popularMovies, ...popular.results!];
    notifyListeners();
  }

  Future<List<Movie>> searchMovie(String name) async {
    if (_searchedMovies.containsKey(name.hashCode)) {
      return _searchedMovies[name.hashCode]!;
    }
    final movies = await _service.getMovieByName(name: name);
    _searchedMovies[name.hashCode] = movies.results!;
    return movies.results!;
  }

  void getSuggestionsByQuery(String searchTerm) {
    _debouncer.value = '';
    _debouncer.onValue = (value) async {
      final results = await searchMovie(searchTerm);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      _debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
