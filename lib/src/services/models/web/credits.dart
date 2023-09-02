import 'package:movies/src/src.dart';

class Credits {
    int? id;
    List<Cast>? cast;
    List<Cast>? crew;

    Credits({
        this.id,
        this.cast,
        this.crew,
    });

    factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        id: json["id"],
        cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null ? [] : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
    );
}
