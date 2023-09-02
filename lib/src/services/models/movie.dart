class Movie {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalName;
  String? overview;
  String? posterPath;
  String? title;
  String? name;
  double? voteAverage;
  int? voteCount;
  String? heroId;

  Movie(
      {this.backdropPath,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalName,
      this.overview,
      this.posterPath,
      this.title,
      this.name,
      this.voteAverage,
      this.voteCount
    });

  get fullPosterImg => posterPath != null
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://i.stack.imgur.com/GNhxO.png';

  get fullBackdropPath => backdropPath != null
      ? 'https://image.tmdb.org/t/p/w500$backdropPath'
      : 'https://i.stack.imgur.com/GNhxO.png';

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"] ?? json["original_name"],
        originalName: json["original_name"] ?? json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"] ?? json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        name: json["name"] ?? json["title"],
      );
}
