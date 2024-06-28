// To parse this JSON data, do
//
//     final worlddaoProductEarningsResult = worlddaoProductEarningsResultFromJson(jsonString);

import 'dart:convert';

enum RewardType {
  STATIC,
  DYNAMIC,
  TEAM;

  String toJson() => name;
  static RewardType fromJson(String json) => values.byName(json);
}

WorlddaoProductEarningsResult worlddaoProductEarningsResultFromJson(
        String str) =>
    WorlddaoProductEarningsResult.fromJson(json.decode(str));

String worlddaoProductEarningsResultToJson(
        WorlddaoProductEarningsResult data) =>
    json.encode(data.toJson());

class WorlddaoProductEarningsResult {
  int total;
  int pages;
  int pageNum;
  int pageSize;
  List<Earning>? earnings;

  WorlddaoProductEarningsResult({
    required this.total,
    required this.pages,
    required this.pageNum,
    required this.pageSize,
    required this.earnings,
  });

  WorlddaoProductEarningsResult copyWith({
    int? total,
    int? pages,
    int? pageNum,
    int? pageSize,
    List<Earning>? earnings,
  }) =>
      WorlddaoProductEarningsResult(
        total: total ?? this.total,
        pages: pages ?? this.pages,
        pageNum: pageNum ?? this.pageNum,
        pageSize: pageSize ?? this.pageSize,
        earnings: earnings ?? this.earnings,
      );

  factory WorlddaoProductEarningsResult.fromJson(Map<String, dynamic> json) =>
      WorlddaoProductEarningsResult(
        total: json["total"],
        pages: json["pages"],
        pageNum: json["pageNum"],
        pageSize: json["pageSize"],
        earnings: json["earnings"] == null
            ? []
            : List<Earning>.from(
                json["earnings"].map((x) => Earning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "pages": pages,
        "pageNum": pageNum,
        "pageSize": pageSize,
        "earnings": earnings == null
            ? []
            : List<dynamic>.from(earnings!.map((x) => x.toJson())),
      };
}

class Earning {
  int id;
  RewardType type;
  String amount;
  int distTime;

  Earning({
    required this.id,
    required this.type,
    required this.amount,
    required this.distTime,
  });

  Earning copyWith({
    int? id,
    RewardType? type,
    String? amount,
    int? distTime,
  }) =>
      Earning(
        id: id ?? this.id,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        distTime: distTime ?? this.distTime,
      );

  factory Earning.fromJson(Map<String, dynamic> json) => Earning(
        id: json["id"],
        type: RewardType.fromJson(json["type"]),
        amount: json["amount"],
        distTime: json["distTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type.toJson(),
        "amount": amount,
        "distTime": distTime,
      };
}
