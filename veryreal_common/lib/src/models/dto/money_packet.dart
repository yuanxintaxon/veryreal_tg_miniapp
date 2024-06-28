// To parse this JSON data, do
//
//     final moneyPacket = moneyPacketFromJson(jsonString);

import 'dart:convert';

enum MoneyPacketType {
  MONEY_PACKET,
  GRAB_MONEY_PACKET;

  String toJson() => name;
  static MoneyPacketType fromJson(String json) => values.byName(json);
}

enum MoneyPacketStatus {
  INIT,
  OPENED,
  FINISHED,
  EXPIRED;

  String toJson() => name;
  static MoneyPacketStatus fromJson(String json) => values.byName(json);
}

MoneyPacket moneyPacketFromJson(String str) =>
    MoneyPacket.fromJson(json.decode(str));

String moneyPacketToJson(MoneyPacket data) => json.encode(data.toJson());

class MoneyPacket {
  int tokenId;
  String tokenName;
  String tokenUrl;
  String serialNo;
  String amount;
  int grabbedCount;
  int totalCount;
  int expireTime;
  bool expired;
  bool completed;
  MPUserInfo owner;
  GrabItem? selfGrabItem;
  List<GrabItem> items;

  MoneyPacket({
    required this.tokenId,
    required this.tokenName,
    required this.tokenUrl,
    required this.serialNo,
    required this.amount,
    required this.grabbedCount,
    required this.totalCount,
    required this.expireTime,
    required this.expired,
    required this.completed,
    required this.owner,
    required this.selfGrabItem,
    required this.items,
  });

  MoneyPacket copyWith({
    int? tokenId,
    String? tokenName,
    String? tokenUrl,
    String? serialNo,
    String? amount,
    int? grabbedCount,
    int? totalCount,
    int? expireTime,
    bool? expired,
    bool? completed,
    MPUserInfo? owner,
    GrabItem? selfGrabItem,
    List<GrabItem>? items,
  }) =>
      MoneyPacket(
        tokenId: tokenId ?? this.tokenId,
        tokenName: tokenName ?? this.tokenName,
        tokenUrl: tokenUrl ?? this.tokenUrl,
        serialNo: serialNo ?? this.serialNo,
        amount: amount ?? this.amount,
        grabbedCount: grabbedCount ?? this.grabbedCount,
        totalCount: totalCount ?? this.totalCount,
        expireTime: expireTime ?? this.expireTime,
        expired: expired ?? this.expired,
        completed: completed ?? this.completed,
        owner: owner ?? this.owner,
        selfGrabItem: selfGrabItem ?? this.selfGrabItem,
        items: items ?? this.items,
      );

  factory MoneyPacket.fromJson(Map<String, dynamic> json) => MoneyPacket(
        tokenId: json["tokenId"],
        tokenName: json["tokenName"],
        tokenUrl: json["tokenUrl"],
        serialNo: json["serialNo"],
        amount: json["amount"],
        grabbedCount: json["grabbedCount"],
        totalCount: json["totalCount"],
        expireTime: json["expireTime"],
        expired: json["expired"],
        completed: json["completed"],
        owner: MPUserInfo.fromJson(json["owner"]),
        selfGrabItem: json["selfGrabItem"] == null
            ? null
            : GrabItem.fromJson(json["selfGrabItem"]),
        items:
            List<GrabItem>.from(json["items"].map((x) => GrabItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenName": tokenName,
        "tokenUrl": tokenUrl,
        "serialNo": serialNo,
        "amount": amount,
        "grabbedCount": grabbedCount,
        "totalCount": totalCount,
        "expireTime": expireTime,
        "expired": expired,
        "completed": completed,
        "owner": owner.toJson(),
        "selfGrabItem": selfGrabItem?.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class GrabItem {
  String amount;
  int grabTime;
  bool theTop;
  MPUserInfo grabber;

  GrabItem({
    required this.amount,
    required this.grabTime,
    required this.theTop,
    required this.grabber,
  });

  GrabItem copyWith({
    String? amount,
    int? grabTime,
    bool? theTop,
    MPUserInfo? grabber,
  }) =>
      GrabItem(
        amount: amount ?? this.amount,
        grabTime: grabTime ?? this.grabTime,
        theTop: theTop ?? this.theTop,
        grabber: grabber ?? this.grabber,
      );

  factory GrabItem.fromJson(Map<String, dynamic> json) => GrabItem(
        amount: json["amount"],
        grabTime: json["grabTime"],
        theTop: json["theTop"],
        grabber: MPUserInfo.fromJson(json["grabber"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "grabTime": grabTime,
        "theTop": theTop,
        "grabber": grabber.toJson(),
      };
}

class MPUserInfo {
  String userId;
  String nickName;
  String faceUrl;

  MPUserInfo({
    required this.userId,
    required this.nickName,
    required this.faceUrl,
  });

  MPUserInfo copyWith({
    String? userId,
    String? nickName,
    String? faceUrl,
  }) =>
      MPUserInfo(
        userId: userId ?? this.userId,
        nickName: nickName ?? this.nickName,
        faceUrl: faceUrl ?? this.faceUrl,
      );

  factory MPUserInfo.fromJson(Map<String, dynamic> json) => MPUserInfo(
        userId: json["userId"],
        nickName: json["nickName"],
        faceUrl: json["faceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickName": nickName,
        "faceUrl": faceUrl,
      };
}
