// To parse this JSON data, do
//
//     final worldClubResult = worldClubResultFromJson(jsonString);

import 'dart:convert';

import '../../../veryreal_common.dart';

WorldClubResult worldClubResultFromJson(String str) =>
    WorldClubResult.fromJson(json.decode(str));

String worldClubResultToJson(WorldClubResult data) =>
    json.encode(data.toJson());

class WorldClubResult {
  List<ExploreClub>? groups;
  List<int>? sort;
  int? total;

  WorldClubResult({
    this.groups,
    this.sort,
    this.total,
  });

  factory WorldClubResult.fromJson(Map<String, dynamic> json) =>
      WorldClubResult(
        groups: json["groups"] == null
            ? []
            : List<ExploreClub>.from(
                json["groups"]!.map((x) => ExploreClub.fromJson(x))),
        sort: json["sort"] == null
            ? []
            : List<int>.from(json["sort"]!.map((x) => x)),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "groups": groups == null
            ? []
            : List<dynamic>.from(groups!.map((x) => x.toJson())),
        "sort": sort == null ? [] : List<dynamic>.from(sort!.map((x) => x)),
        "total": total,
      };
}
