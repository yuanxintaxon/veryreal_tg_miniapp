// To parse this JSON data, do
//
//     final worldUser = worldUserFromJson(jsonString);

import 'dart:convert';

WorldUser worldUserFromJson(String str) => WorldUser.fromJson(json.decode(str));

String worldUserToJson(WorldUser data) => json.encode(data.toJson());

class WorldUser {
  int? userId;
  String? nickname;
  String? faceUrl;
  bool? verified;
  int? vip;
  int? gender;
  int? age;
  String? zodiac;
  int? height;
  int? weight;
  List<String>? momentsImage;
  String? igUsername;
  String? city;
  String? aboutMe;
  String? introVideo;
  int? lastOnline;
  int? visitTime;

  WorldUser({
    this.userId,
    this.nickname,
    this.faceUrl,
    this.verified,
    this.vip,
    this.gender,
    this.age,
    this.zodiac,
    this.height,
    this.weight,
    this.momentsImage,
    this.igUsername,
    this.city,
    this.aboutMe,
    this.introVideo,
    this.lastOnline,
    this.visitTime,
  });

  factory WorldUser.fromJson(Map<String, dynamic> json) => WorldUser(
        userId: json["userId"],
        nickname: json["nickname"],
        faceUrl: json["faceUrl"],
        verified: json["verified"],
        vip: json["vip"],
        gender: json["gender"],
        age: json["age"],
        zodiac: json["zodiac"],
        height: json["height"],
        weight: json["weight"],
        momentsImage: json["momentsImage"] == null
            ? []
            : List<String>.from(json["momentsImage"]!.map((x) => x)),
        igUsername: json["igUsername"],
        city: json["city"],
        aboutMe: json["aboutMe"],
        introVideo: json["introVideo"],
        lastOnline: json["lastOnline"],
        visitTime: json["visitTime"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickname": nickname,
        "faceUrl": faceUrl,
        "verified": verified,
        "vip": vip,
        "gender": gender,
        "age": age,
        "zodiac": zodiac,
        "height": height,
        "weight": weight,
        "momentsImage": momentsImage == null
            ? []
            : List<dynamic>.from(momentsImage!.map((x) => x)),
        "igUsername": igUsername,
        "city": city,
        "aboutMe": aboutMe,
        "introVideo": introVideo,
        "lastOnline": lastOnline,
        "visitTime": visitTime,
      };
}
