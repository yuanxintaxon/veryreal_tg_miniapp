// To parse this JSON data, do
//
//     final worldMomentsResult = worldMomentsResultFromJson(jsonString);

import 'dart:convert';

import 'package:veryreal_common/veryreal_common.dart';

WorldMomentsResult worldMomentsResultFromJson(String str) =>
    WorldMomentsResult.fromJson(json.decode(str));

String worldMomentsResultToJson(WorldMomentsResult data) =>
    json.encode(data.toJson());

class WorldMomentsResult {
  int? total;
  List<dynamic>? sort;
  List<WorkMoments>? records;

  WorldMomentsResult({
    this.total,
    this.sort,
    this.records,
  });

  factory WorldMomentsResult.fromJson(Map<String, dynamic> json) =>
      WorldMomentsResult(
        total: json["total"],
        sort: json["sort"] == null
            ? []
            : List<dynamic>.from(json["sort"]!.map((x) => x)),
        records: json["records"] == null
            ? []
            : List<WorkMoments>.from(
                json["records"]!.map((x) => WorkMoments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "sort": sort == null ? [] : List<dynamic>.from(sort!.map((x) => x)),
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}
