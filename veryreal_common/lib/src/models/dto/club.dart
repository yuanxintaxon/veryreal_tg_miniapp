// To parse this JSON data, do
//
//     final club = clubFromJson(jsonString);

import 'dart:convert';

Club clubFromJson(String str) => Club.fromJson(json.decode(str));

String clubToJson(Club data) => json.encode(data.toJson());

class Club {
  String? groupId;
  String? groupName;
  String? notification;
  String? introduction;
  String? faceUrl;
  String? ownerUserId;
  int? memberCount;
  String? ex;
  String? creatorUserId;
  int? status;
  int? groupType;
  int? needVerification;
  dynamic lookMemberFriend;
  int? applyMemberFriend;
  int? notificationUpdateTime;
  String? notificationUserId;
  int? publicType;
  int? createTime;

  Club({
    this.groupId,
    this.groupName,
    this.notification,
    this.introduction,
    this.faceUrl,
    this.ownerUserId,
    this.memberCount,
    this.ex,
    this.creatorUserId,
    this.status,
    this.groupType,
    this.needVerification,
    this.lookMemberFriend,
    this.applyMemberFriend,
    this.notificationUpdateTime,
    this.notificationUserId,
    this.publicType,
    this.createTime,
  });

  factory Club.fromJson(Map<String, dynamic> json) => Club(
        groupId: json["groupID"],
        groupName: json["groupName"],
        notification: json["notification"],
        introduction: json["introduction"],
        faceUrl: json["faceURL"],
        ownerUserId: json["ownerUserID"],
        memberCount: json["memberCount"],
        ex: json["ex"],
        creatorUserId: json["creatorUserID"],
        status: json["status"],
        groupType: json["groupType"],
        needVerification: json["needVerification"],
        lookMemberFriend: json["lookMemberFriend"],
        applyMemberFriend: json["applyMemberFriend"],
        notificationUpdateTime: json["notificationUpdateTime"],
        notificationUserId: json["notificationUserID"],
        publicType: json["publicType"],
        createTime: json["createTime"],
      );

  Map<String, dynamic> toJson() => {
        "groupID": groupId,
        "groupName": groupName,
        "notification": notification,
        "introduction": introduction,
        "faceURL": faceUrl,
        "ownerUserID": ownerUserId,
        "memberCount": memberCount,
        "ex": ex,
        "creatorUserID": creatorUserId,
        "status": status,
        "groupType": groupType,
        "needVerification": needVerification,
        "lookMemberFriend": lookMemberFriend,
        "applyMemberFriend": applyMemberFriend,
        "notificationUpdateTime": notificationUpdateTime,
        "notificationUserID": notificationUserId,
        "publicType": publicType,
        "createTime": createTime,
      };
}
