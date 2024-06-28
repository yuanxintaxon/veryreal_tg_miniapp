import 'dart:convert';


import '../../../veryreal_common.dart';

WorldFilterData worldFilterDataFromJson(String str) =>
    WorldFilterData.fromJson(json.decode(str));

String worldFilterDataToJson(WorldFilterData data) =>
    json.encode(data.toJson());

class WorldFilterData {
  String? searchType;
  int gender;
  List<TagChip> selectedCities;
  List<MyTag> selectedFeatures;
  MinMaxObj age;
  MinMaxObj height;
  MinMaxObj weight;

  WorldFilterData({
    this.searchType,
    required this.gender,
    required this.selectedCities,
    required this.selectedFeatures,
    required this.age,
    required this.height,
    required this.weight,
  });

  WorldFilterData copyWith({
    String? searchType,
    int? gender,
    List<TagChip>? selectedCities,
    List<MyTag>? selectedFeatures,
    MinMaxObj? age,
    MinMaxObj? height,
    MinMaxObj? weight,
  }) =>
      WorldFilterData(
        searchType: searchType ?? this.searchType,
        gender: gender ?? this.gender,
        selectedCities: selectedCities ?? this.selectedCities,
        selectedFeatures: selectedFeatures ?? this.selectedFeatures,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
      );

  factory WorldFilterData.fromJson(Map<String, dynamic> json) =>
      WorldFilterData(
        searchType: json["searchType"],
        gender: json["gender"],
        selectedCities: List<TagChip>.from(
            json["selectedCities"].map((x) => TagChip.fromJson(x))),
        selectedFeatures: List<MyTag>.from(
            json["selectedFeatures"].map((x) => MyTag.fromJson(x))),
        age: MinMaxObj.fromJson(json["age"]),
        height: MinMaxObj.fromJson(json["height"]),
        weight: MinMaxObj.fromJson(json["weight"]),
      );

  Map<String, dynamic> toJson() => {
        "searchType": searchType,
        "gender": gender,
        "selectedCities":
            List<dynamic>.from(selectedCities.map((x) => x.toJson())),
        "selectedFeatures":
            List<dynamic>.from(selectedFeatures.map((x) => x.toJson())),
        "age": age.toJson(),
        "height": height.toJson(),
        "weight": weight.toJson(),
      };
}

class MinMaxObj {
  double min;
  double max;

  MinMaxObj({
    required this.min,
    required this.max,
  });

  factory MinMaxObj.fromJson(Map<String, dynamic> json) => MinMaxObj(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}
