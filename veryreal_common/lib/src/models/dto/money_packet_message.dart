// To parse this JSON data, do
//
//     final moneyPacketMessage = moneyPacketMessageFromJson(jsonString);

import 'dart:convert';


import '../../../veryreal_common.dart';

MoneyPacketMessage moneyPacketMessageFromJson(String str) =>
    MoneyPacketMessage.fromJson(json.decode(str));

String moneyPacketMessageToJson(MoneyPacketMessage data) =>
    json.encode(data.toJson());

class MoneyPacketMessage {
  MPSUserInfo owner;
  String serialNo;
  TokenInfo? tokenInfo;
  MoneyPacketType type;
  MoneyPacketStatus? status;
  String? wish;
  MPSUserInfo? grabber;

  MoneyPacketMessage({
    required this.owner,
    required this.serialNo,
    this.tokenInfo,
    required this.type,
    this.status,
    this.wish,
    this.grabber,
  });

  MoneyPacketMessage copyWith({
    MPSUserInfo? owner,
    String? serialNo,
    TokenInfo? tokenInfo,
    MoneyPacketType? type,
    MoneyPacketStatus? status,
    String? wish,
    MPSUserInfo? grabber,
  }) =>
      MoneyPacketMessage(
        owner: owner ?? this.owner,
        serialNo: serialNo ?? this.serialNo,
        tokenInfo: tokenInfo ?? this.tokenInfo,
        type: type ?? this.type,
        status: status ?? this.status,
        wish: wish ?? this.wish,
        grabber: grabber ?? this.grabber,
      );

  factory MoneyPacketMessage.fromJson(Map<String, dynamic> json) =>
      MoneyPacketMessage(
        owner: MPSUserInfo.fromJson(json["owner"]),
        serialNo: json["serialNo"],
        tokenInfo: json["tokenInfo"] == null
            ? null
            : TokenInfo.fromJson(json["tokenInfo"]),
        type: MoneyPacketType.fromJson(json["type"]),
        status: json["status"] == null
            ? null
            : MoneyPacketStatus.fromJson(json["status"]),
        wish: json["wish"],
        grabber: json["grabber"] == null
            ? null
            : MPSUserInfo.fromJson(json["grabber"]),
      );

  Map<String, dynamic> toJson() => {
        "owner": owner.toJson(),
        "serialNo": serialNo,
        "tokenInfo": tokenInfo?.toJson(),
        "type": type.toJson(),
        "status": status?.toJson(),
        "wish": wish,
        "grabber": grabber?.toJson(),
      };
}

class MPSUserInfo {
  String faceUrl;
  String nickname;
  String userId;

  MPSUserInfo({
    required this.faceUrl,
    required this.nickname,
    required this.userId,
  });

  MPSUserInfo copyWith({
    String? faceUrl,
    String? nickname,
    String? userId,
  }) =>
      MPSUserInfo(
        faceUrl: faceUrl ?? this.faceUrl,
        nickname: nickname ?? this.nickname,
        userId: userId ?? this.userId,
      );

  factory MPSUserInfo.fromJson(Map<String, dynamic> json) => MPSUserInfo(
        faceUrl: json["faceURL"],
        nickname: json["nickname"],
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "faceURL": faceUrl,
        "nickname": nickname,
        "userID": userId,
      };
}
