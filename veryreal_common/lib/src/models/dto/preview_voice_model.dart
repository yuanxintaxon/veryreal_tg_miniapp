// To parse this JSON data, do
//
//     final previewVoiceModel = previewVoiceModelFromJson(jsonString);

import 'dart:convert';

enum VoiceModelStatus {
  INIT,
  SUCCESS,
  FAIL,
  BAD_VOICE;

  String toJson() => name;
  static VoiceModelStatus fromJson(String json) => values.byName(json);
}

PreviewVoiceModel previewVoiceModelFromJson(String str) =>
    PreviewVoiceModel.fromJson(json.decode(str));

String previewVoiceModelToJson(PreviewVoiceModel data) =>
    json.encode(data.toJson());

class PreviewVoiceModel {
  int? id;
  String? orginVoiceLang;
  String? orginVoiceUrl;
  String? destVoiceLang;
  String? destVoiceUrl;
  String? voicePrompt;
  VoiceModelStatus? status;

  PreviewVoiceModel({
    this.id,
    this.orginVoiceLang,
    this.orginVoiceUrl,
    this.destVoiceLang,
    this.destVoiceUrl,
    this.voicePrompt,
    this.status,
  });

  factory PreviewVoiceModel.fromJson(Map<String, dynamic> json) =>
      PreviewVoiceModel(
        id: json["id"],
        orginVoiceLang: json["orginVoiceLang"],
        orginVoiceUrl: json["orginVoiceUrl"],
        destVoiceLang: json["destVoiceLang"],
        destVoiceUrl: json["destVoiceUrl"],
        voicePrompt: json["voicePrompt"],
        status: json["status"] == null
            ? null
            : VoiceModelStatus.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orginVoiceLang": orginVoiceLang,
        "orginVoiceUrl": orginVoiceUrl,
        "destVoiceLang": destVoiceLang,
        "destVoiceUrl": destVoiceUrl,
        "voicePrompt": voicePrompt,
        "status": status?.toJson(),
      };
}
