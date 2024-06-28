// To parse this JSON data, do
//
//     final meetingConfig = meetingConfigFromJson(jsonString);

import 'dart:convert';

MeetingConfig meetingConfigFromJson(String str) =>
    MeetingConfig.fromJson(json.decode(str));

String meetingConfigToJson(MeetingConfig data) => json.encode(data.toJson());

class MeetingConfig {
  int minCount;
  int maxCount;

  MeetingConfig({
    required this.minCount,
    required this.maxCount,
  });

  factory MeetingConfig.fromJson(Map<String, dynamic> json) => MeetingConfig(
        minCount: json["minCount"],
        maxCount: json["maxCount"],
      );

  Map<String, dynamic> toJson() => {
        "minCount": minCount,
        "maxCount": maxCount,
      };
}
