// To parse this JSON data, do
//
//     final worlddaoApplication = worlddaoApplicationFromJson(jsonString);

import 'dart:convert';

WorlddaoApplication worlddaoApplicationFromJson(String str) =>
    WorlddaoApplication.fromJson(json.decode(str));

String worlddaoApplicationToJson(WorlddaoApplication data) =>
    json.encode(data.toJson());

class WorlddaoApplication {
  int id;
  String name;
  String desc;
  String iconUrl;
  String? linkUrl;

  WorlddaoApplication({
    required this.id,
    required this.name,
    required this.desc,
    required this.iconUrl,
    required this.linkUrl,
  });

  WorlddaoApplication copyWith({
    int? id,
    String? name,
    String? desc,
    String? iconUrl,
    String? linkUrl,
  }) =>
      WorlddaoApplication(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        iconUrl: iconUrl ?? this.iconUrl,
        linkUrl: linkUrl ?? this.linkUrl,
      );

  factory WorlddaoApplication.fromJson(Map<String, dynamic> json) =>
      WorlddaoApplication(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        iconUrl: json["iconUrl"],
        linkUrl: json["linkUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "iconUrl": iconUrl,
        "linkUrl": linkUrl,
      };
}
