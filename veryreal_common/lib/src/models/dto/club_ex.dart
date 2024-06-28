// To parse this JSON data, do
//
//     final clubEx = clubExFromJson(jsonString);

import 'dart:convert';

ClubEx clubExFromJson(String str) => ClubEx.fromJson(json.decode(str));

String clubExToJson(ClubEx data) => json.encode(data.toJson());

class ClubEx {
  int? publicType;
  String? introduction;


  ClubEx({
    this.publicType,
    this.introduction,
  });

  factory ClubEx.fromJson(Map<String, dynamic> json) => ClubEx(
        publicType: json["publicType"],
        introduction: json["introduction"],
      );

  Map<String, dynamic> toJson() => {
        "publicType": publicType,
        "introduction": introduction,
      };
}
