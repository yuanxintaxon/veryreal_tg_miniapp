// To parse this JSON data, do
//
//     final voiceModel = voiceModelFromJson(jsonString);

import 'dart:convert';

VoiceModel voiceModelFromJson(String str) =>
    VoiceModel.fromJson(json.decode(str));

String voiceModelToJson(VoiceModel data) => json.encode(data.toJson());

class VoiceModel {
  String language;
  int languageId;
  List<VoiceModelElement> voiceModels;

  VoiceModel({
    required this.language,
    required this.languageId,
    required this.voiceModels,
  });

  factory VoiceModel.fromJson(Map<String, dynamic> json) => VoiceModel(
        language: json["language"],
        languageId: json["languageId"],
        voiceModels: List<VoiceModelElement>.from(
            json["voiceModels"].map((x) => VoiceModelElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "languageId": languageId,
        "voiceModels": List<dynamic>.from(voiceModels.map((x) => x.toJson())),
      };
}

class VoiceModelElement {
  int id;
  String modelName;
  String modelUrl;
  bool customized;
  bool selected;

  VoiceModelElement({
    required this.id,
    required this.modelName,
    required this.modelUrl,
    required this.customized,
    required this.selected,
  });

  factory VoiceModelElement.fromJson(Map<String, dynamic> json) =>
      VoiceModelElement(
        id: json["id"],
        modelName: json["modelName"],
        modelUrl: json["modelUrl"],
        customized: json["customized"],
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelName": modelName,
        "modelUrl": modelUrl,
        "customized": customized,
        "selected": selected,
      };
}
