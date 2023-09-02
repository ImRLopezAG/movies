
import 'package:movies/src/src.dart';

class Videos {
    int? id;
    List<Video>? results;

    Videos({
        this.id,
        this.results,
    });

    factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        id: json["id"],
        results: json["results"] == null ? [] : List<Video>.from(json["results"]!.map((x) => Video.fromJson(x))),
    );
}

