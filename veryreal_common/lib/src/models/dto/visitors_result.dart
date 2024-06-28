// To parse this JSON data, do
//
//     final visitorsResult = visitorsResultFromJson(jsonString);

import 'dart:convert';

import '../../../veryreal_common.dart';

VisitorsResult visitorsResultFromJson(String str) =>
    VisitorsResult.fromJson(json.decode(str));

String visitorsResultToJson(VisitorsResult data) => json.encode(data.toJson());

class VisitorsResult {
  List<WorldUser>? records;
  int? total;
  int? size;
  int? current;
  List<dynamic>? orders;
  bool? optimizeCountSql;
  bool? searchCount;
  dynamic maxLimit;
  dynamic countId;
  int? pages;

  VisitorsResult({
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

  factory VisitorsResult.fromJson(Map<String, dynamic> json) => VisitorsResult(
        records: json["records"] == null
            ? []
            : List<WorldUser>.from(
                json["records"]!.map((x) => WorldUser.fromJson(x))),
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
