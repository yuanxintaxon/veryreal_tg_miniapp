// To parse this JSON data, do
//
//     final voiceCloningStatus = voiceCloningStatusFromJson(jsonString);

import 'dart:convert';

import '../../../veryreal_common.dart';

VoiceCloningStatus voiceCloningStatusFromJson(String str) =>
    VoiceCloningStatus.fromJson(json.decode(str));

String voiceCloningStatusToJson(VoiceCloningStatus data) =>
    json.encode(data.toJson());

class VoiceCloningStatus {
  int finished;
  int total;
  VoiceModelStatus status;
  int statusCode;

  VoiceCloningStatus({
    required this.finished,
    required this.total,
    required this.status,
    required this.statusCode,
  });

  factory VoiceCloningStatus.fromJson(Map<String, dynamic> json) =>
      VoiceCloningStatus(
        finished: json["finished"],
        total: json["total"],
        status: VoiceModelStatus.fromJson(json["status"]),
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "finished": finished,
        "total": total,
        "status": status.toJson(),
        "statusCode": statusCode,
      };
}
