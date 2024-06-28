// To parse this JSON data, do
//
//     final meetingVirtualUser = meetingVirtualUserFromJson(jsonString);

import 'dart:convert';

List<MeetingVirtualUser> meetingVirtualUserFromJson(String str) =>
    List<MeetingVirtualUser>.from(
        json.decode(str).map((x) => MeetingVirtualUser.fromJson(x)));

String meetingVirtualUserToJson(List<MeetingVirtualUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeetingVirtualUser {
  int id;
  String userId;
  String nickname;
  String? faceUrl;
  int createdAt;

  MeetingVirtualUser({
    required this.id,
    required this.userId,
    required this.nickname,
    this.faceUrl,
    required this.createdAt,
  });

  factory MeetingVirtualUser.fromJson(Map<String, dynamic> json) =>
      MeetingVirtualUser(
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
