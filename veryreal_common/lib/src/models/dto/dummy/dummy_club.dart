// To parse this JSON data, do
//
//     final dummyClub = dummyClubFromJson(jsonString);

import 'dart:convert';

DummyClub dummyClubFromJson(String str) => DummyClub.fromJson(json.decode(str));

String dummyClubToJson(DummyClub data) => json.encode(data.toJson());

class DummyClub {
  String clubName;
  String clubAnnouncement;
  int memberCount;
  List<String> membersAvatar;

  DummyClub({
    required this.clubName,
    required this.clubAnnouncement,
    required this.memberCount,
    required this.membersAvatar,
  });

  factory DummyClub.fromJson(Map<String, dynamic> json) => DummyClub(
        clubName: json["clubName"],
        clubAnnouncement: json["clubAnnouncement"],
        memberCount: json["memberCount"],
        membersAvatar: List<String>.from(json["membersAvatar"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "clubName": clubName,
        "clubAnnouncement": clubAnnouncement,
        "memberCount": memberCount,
        "membersAvatar": List<dynamic>.from(membersAvatar.map((x) => x)),
      };
}
