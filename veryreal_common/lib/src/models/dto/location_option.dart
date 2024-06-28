// To parse this JSON data, do
//
//     final locationOption = locationOptionFromJson(jsonString);

import 'dart:convert';

List<LocationOption> locationOptionFromJson(String str) =>
    List<LocationOption>.from(
        json.decode(str).map((x) => LocationOption.fromJson(x)));

String locationOptionToJson(List<LocationOption> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationOption {
  int? id;
  int? parentId;
  String? name;
  String? nameEn;
  String? areaCode;

  LocationOption({
    this.id,
    this.parentId,
    this.name,
    this.nameEn,
    this.areaCode,
  });

  factory LocationOption.fromJson(Map<String, dynamic> json) => LocationOption(
        id: json["id"],
        parentId: json["parentId"],
        name: json["name"],
        nameEn: json["nameEn"],
        areaCode: json["areaCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "name": name,
        "nameEn": nameEn,
        "areaCode": areaCode,
      };
}
