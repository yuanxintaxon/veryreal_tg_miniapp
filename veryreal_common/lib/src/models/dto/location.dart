class Location {
  int? id;
  int? level;
  String? name;
  Location? parent;

  Location({
    this.id,
    this.level,
    this.name,
    this.parent,
  });

  Location copyWith({
    int? id,
    int? level,
    String? name,
    Location? parent,
  }) =>
      Location(
        id: id ?? this.id,
        level: level ?? this.level,
        name: name ?? this.name,
        parent: parent ?? this.parent,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        level: json["level"],
        name: json["name"],
        parent:
            json["parent"] == null ? null : Location.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "name": name,
        "parent": parent?.toJson(),
      };
}
