// To parse this JSON data, do
//
//     final groupVirtualUser = groupVirtualUserFromJson(jsonString);

import 'dart:convert';

GroupVirtualUser groupVirtualUserFromJson(String str) =>
    GroupVirtualUser.fromJson(json.decode(str));

String groupVirtualUserToJson(GroupVirtualUser data) =>
    json.encode(data.toJson());

class GroupVirtualUser {
  int? id;
  String? userId;
  String? nickname;
  String? faceUrl;
  int? createdAt;

  GroupVirtualUser({
    this.id,
    this.userId,
    this.nickname,
    this.faceUrl,
    this.createdAt,
  });

  factory GroupVirtualUser.fromJson(Map<String, dynamic> json) =>
      GroupVirtualUser(
        id: json["id"],
        userId: json["userId"],
        nickname: json["nickname"],
        faceUrl: json["faceUrl"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "nickname": nickname,
        "faceUrl": faceUrl,
        "createdAt": createdAt,
      };
}
