class Video {
    String? name;
    String? key;
    int? size;
    bool? official;
    String? id;

    Video({
        this.name,
        this.key,
        this.size,
        this.official,
        this.id,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        name: json["name"],
        key: json["key"],
        size: json["size"],
        official: json["official"],
        id: json["id"],
    );
}


