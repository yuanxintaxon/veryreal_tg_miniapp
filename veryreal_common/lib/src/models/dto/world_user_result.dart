// To parse this JSON data, do
//
//     final worldUserResult = worldUserResultFromJson(jsonString);

import 'dart:convert';

import 'world_user.dart';

WorldUserResult worldUserResultFromJson(String str) =>
    WorldUserResult.fromJson(json.decode(str));

String worldUserResultToJson(WorldUserResult data) =>
    json.encode(data.toJson());

class WorldUserResult {
  List<WorldUser>? users;
  List<int>? sort;
  int? total;

  WorldUserResult({
    this.users,
    this.sort,
    this.total,
  });

  factory WorldUserResult.fromJson(Map<String, dynamic> json) =>
      WorldUserResult(
        users: json["users"] == null
            ? []
            : List<WorldUser>.from(
                json["users"]!.map((x) => WorldUser.fromJson(x))),
        sort: json["sort"] == null
            ? []
            : List<int>.from(json["sort"]!.map((x) => x)),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
        "sort": sort == null ? [] : List<dynamic>.from(sort!.map((x) => x)),
        "total": total,
      };
}
