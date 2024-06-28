// To parse this JSON data, do
//
//     final carechatMember = carechatMemberFromJson(jsonString);

import 'dart:convert';

CarechatMember carechatMemberFromJson(String str) =>
    CarechatMember.fromJson(json.decode(str));

String carechatMemberToJson(CarechatMember data) => json.encode(data.toJson());

class CarechatMember {
  String userId;
  String nickname;
  String relationToCared;

  CarechatMember({
    required this.userId,
    required this.nickname,
    required this.relationToCared,
  });

  CarechatMember copyWith({
    String? userId,
    String? nickname,
    String? relationToCared,
  }) =>
      CarechatMember(
        userId: userId ?? this.userId,
        nickname: nickname ?? this.nickname,
        relationToCared: relationToCared ?? this.relationToCared,
      );

  factory CarechatMember.fromJson(Map<String, dynamic> json) => CarechatMember(
        userId: json["userID"],
        nickname: json["nickname"],
        relationToCared: json["relationToCared"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "nickname": nickname,
        "relationToCared": relationToCared,
      };
}
