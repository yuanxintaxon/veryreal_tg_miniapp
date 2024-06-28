// To parse this JSON data, do
//
//     final meetingInfoV = meetingInfoVFromJson(jsonString);

import 'dart:convert';

MeetingInfoV meetingInfoVFromJson(String str) =>
    MeetingInfoV.fromJson(json.decode(str));

String meetingInfoVToJson(MeetingInfoV data) => json.encode(data.toJson());

class MeetingInfoV {
  String? roomId;
  String? meetingName;
  String? hostUserId;
  int? status;
  int? startTime;
  int? endTime;
  int? createTime;
  String? ex;
  bool? virtualUserEnabled;
  int? virtualUserCount;

  MeetingInfoV({
    this.roomId,
    this.meetingName,
    this.hostUserId,
    this.status,
    this.startTime,
    this.endTime,
    this.createTime,
    this.ex,
    this.virtualUserEnabled,
    this.virtualUserCount,
  });

  factory MeetingInfoV.fromJson(Map<String, dynamic> json) => MeetingInfoV(
        roomId: json["roomId"],
        meetingName: json["meetingName"],
        hostUserId: json["hostUserId"],
        status: json["status"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createTime: json["createTime"],
        ex: json["ex"],
        virtualUserEnabled: json["virtualUserEnabled"],
        virtualUserCount: json["virtualUserCount"],
      );

  Map<String, dynamic> toJson() => {
        "roomId": roomId,
        "meetingName": meetingName,
        "hostUserId": hostUserId,
        "status": status,
        "startTime": startTime,
        "endTime": endTime,
        "createTime": createTime,
        "ex": ex,
        "virtualUserEnabled": virtualUserEnabled,
        "virtualUserCount": virtualUserCount,
      };
}
