import 'package:movies/src/src.dart';

class Movies {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Movie>.from(
                json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
