// To parse this JSON data, do
//
//     final dummyUser = dummyUserFromJson(jsonString);

import 'dart:convert';

DummyUser dummyUserFromJson(String str) => DummyUser.fromJson(json.decode(str));

String dummyUserToJson(DummyUser data) => json.encode(data.toJson());

class DummyUser {
  DateTime? lastOnline; // Make lastOnline nullable with DateTime?
  String nickname;
  String faceUrl;
  bool verified;
  int gender;
  int age;
  String zodiac;
  int height;
  int weight;
  List<String> momentsImage;
  String momentTagline;
  String igUsername;
  String city;

  DummyUser({
    this.lastOnline, // Update here to make lastOnline nullable
    required this.nickname,
    required this.faceUrl,
    required this.verified,
    required this.gender,
    required this.age,
    required this.zodiac,
    required this.height,
    required this.weight,
    required this.momentsImage,
    required this.momentTagline,
    required this.igUsername,
    required this.city,
  });

  factory DummyUser.fromJson(Map<String, dynamic> json) => DummyUser(
        lastOnline: json["lastOnline"] != null
            ? DateTime.parse(json["lastOnline"])
            : null,
        nickname: json["nickname"],
        faceUrl: json["faceUrl"],
        verified: json["verified"],
        gender: json["gender"],
        age: json["age"],
        zodiac: json["zodiac"],
        height: json["height"],
        weight: json["weight"],
        momentsImage: List<String>.from(json["momentsImage"].map((x) => x)),
        momentTagline: json["momentTagline"],
        igUsername: json["igUsername"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "lastOnline":
            lastOnline?.toIso8601String(), // Use null-aware operator here
        "nickname": nickname,
        "faceUrl": faceUrl,
        "verified": verified,
        "gender": gender,
        "age": age,
        "zodiac": zodiac,
        "height": height,
        "weight": weight,
        "momentsImage": List<dynamic>.from(momentsImage.map((x) => x)),
        "momentTagline": momentTagline,
        "igUsername": igUsername,
        "city": city,
      };
}
