// To parse this JSON data, do
//
//     final worlddaoProduct = worlddaoProductFromJson(jsonString);

import 'dart:convert';

enum DistType {
  DAY,
  WEEK,
  MONTH,
  QUARTER,
  YEAR;

  String toJson() => name;
  static DistType fromJson(String json) => values.byName(json);
}

WorlddaoProduct worlddaoProductFromJson(String str) =>
    WorlddaoProduct.fromJson(json.decode(str));

String worlddaoProductToJson(WorlddaoProduct data) =>
    json.encode(data.toJson());

class WorlddaoProduct {
  int productId;
  String name;
  String logoUrl;
  String desc;
  String? dailyIncome;
  int? term;
  int? terms;
  DistType? distType;
  int? limitCount;
  int? totalCount;
  int? finishedCount;
  int? startTime;
  int? endTime;
  String? profit;
  String? price;
  int? priceTokenId;
  String? priceTokenName;
  int? state;

  WorlddaoProduct({
    required this.productId,
    required this.name,
    required this.logoUrl,
    required this.desc,
    this.dailyIncome,
    this.term,
    this.terms,
    this.distType,
    this.limitCount,
    this.totalCount,
    this.finishedCount,
    this.startTime,
    this.endTime,
    this.profit,
    this.price,
    this.priceTokenId,
    this.priceTokenName,
    this.state,
  });

  WorlddaoProduct copyWith({
    int? productId,
    String? name,
    String? logoUrl,
    String? desc,
    String? dailyIncome,
    int? term,
    int? terms,
    DistType? distType,
    int? limitCount,
    int? totalCount,
    int? finishedCount,
    int? startTime,
    int? endTime,
    String? profit,
    String? price,
    int? priceTokenId,
    String? priceTokenName,
    int? state,
  }) =>
      WorlddaoProduct(
        productId: productId ?? this.productId,
        name: name ?? this.name,
        logoUrl: logoUrl ?? this.logoUrl,
        desc: desc ?? this.desc,
        dailyIncome: dailyIncome ?? this.dailyIncome,
        term: term ?? this.term,
        terms: terms ?? this.terms,
        distType: distType ?? this.distType,
        limitCount: limitCount ?? this.limitCount,
        totalCount: totalCount ?? this.totalCount,
        finishedCount: finishedCount ?? this.finishedCount,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        profit: profit ?? this.profit,
        price: price ?? this.price,
        priceTokenId: priceTokenId ?? this.priceTokenId,
        priceTokenName: priceTokenName ?? this.priceTokenName,
        state: state ?? this.state,
      );

  factory WorlddaoProduct.fromJson(Map<String, dynamic> json) =>
      WorlddaoProduct(
        productId: json["productId"],
        name: json["name"],
        logoUrl: json["logoUrl"],
        desc: json["desc"],
        dailyIncome: json["dailyIncome"],
        term: json["term"],
        terms: json["terms"],
        distType: json["distType"] == null
            ? null
            : DistType.fromJson(json["distType"]),
        limitCount: json["limitCount"],
        totalCount: json["totalCount"],
        finishedCount: json["finishedCount"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        profit: json["profit"],
        price: json["price"],
        priceTokenId: json["priceTokenId"],
        priceTokenName: json["priceTokenName"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "logoUrl": logoUrl,
        "desc": desc,
        "dailyIncome": dailyIncome,
        "term": term,
        "terms": terms,
        "distType": distType?.toJson(),
        "limitCount": limitCount,
        "totalCount": totalCount,
        "finishedCount": finishedCount,
        "startTime": startTime,
        "endTime": endTime,
        "profit": profit,
        "price": price,
        "priceTokenId": priceTokenId,
        "priceTokenName": priceTokenName,
        "state": state,
      };
}
