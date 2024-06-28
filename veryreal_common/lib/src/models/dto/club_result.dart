// To parse this JSON data, do
//
//     final clubResult = clubResultFromJson(jsonString);

import 'dart:convert';

import 'explore_club.dart';

ClubResult clubResultFromJson(String str) =>
    ClubResult.fromJson(json.decode(str));

String clubResultToJson(ClubResult data) => json.encode(data.toJson());

class ClubResult {
  List<ExploreClub>? records;
  int? total;
  int? size;
  int? current;
  List<dynamic>? orders;
  bool? optimizeCountSql;
  bool? searchCount;
  dynamic maxLimit;
  dynamic countId;
  int? pages;

  ClubResult({
    this.records,
    this.total,
    this.size,
    this.current,
    this.orders,
    this.optimizeCountSql,
    this.searchCount,
    this.maxLimit,
    this.countId,
    this.pages,
  });

  factory ClubResult.fromJson(Map<String, dynamic> json) => ClubResult(
        records: json["records"] == null
            ? []
            : List<ExploreClub>.from(
                json["records"]!.map((x) => ExploreClub.fromJson(x))),
        total: json["total"],
        size: json["size"],
        current: json["current"],
        orders: json["orders"] == null
            ? []
            : List<dynamic>.from(json["orders"]!.map((x) => x)),
        optimizeCountSql: json["optimizeCountSql"],
        searchCount: json["searchCount"],
        maxLimit: json["maxLimit"],
        countId: json["countId"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
        "total": total,
        "size": size,
        "current": current,
        "orders":
            orders == null ? [] : List<dynamic>.from(orders!.map((x) => x)),
        "optimizeCountSql": optimizeCountSql,
        "searchCount": searchCount,
        "maxLimit": maxLimit,
        "countId": countId,
        "pages": pages,
      };
}
