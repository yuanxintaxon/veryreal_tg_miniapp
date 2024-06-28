// To parse this JSON data, do
//
//     final voiceCloningStepTaskHistory = voiceCloningStepTaskHistoryFromJson(jsonString);

import 'dart:convert';

VoiceCloningStepTaskHistory voiceCloningStepTaskHistoryFromJson(String str) =>
    VoiceCloningStepTaskHistory.fromJson(json.decode(str));

String voiceCloningStepTaskHistoryToJson(VoiceCloningStepTaskHistory data) =>
    json.encode(data.toJson());

class VoiceCloningStepTaskHistory {
  int? curStep;
  int? taskId;

  VoiceCloningStepTaskHistory({
    this.curStep,
    this.taskId,
  });

  factory VoiceCloningStepTaskHistory.fromJson(Map<String, dynamic> json) =>
      VoiceCloningStepTaskHistory(
        curStep: json["curStep"],
        taskId: json["taskId"],
      );

  Map<String, dynamic> toJson() => {
        "curStep": curStep,
        "taskId": taskId,
      };
}
