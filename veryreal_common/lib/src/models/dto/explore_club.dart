import '../../../veryreal_common.dart';

class ExploreClub {
  int? groupId;
  String? groupName;
  String? faceUrl;
  String? introduction;
  Member? owner;
  List<Member>? members;
  int? memberCount;
  int? virtualUserCount;
  int? sessionType;

  ExploreClub({
    this.groupId,
    this.groupName,
    this.faceUrl,
    this.introduction,
    this.owner,
    this.members,
    this.memberCount,
    this.virtualUserCount,
    this.sessionType,
  });

  ExploreClub copyWith({
    int? groupId,
    String? groupName,
    String? faceUrl,
    String? introduction,
    Member? owner,
    List<Member>? members,
    int? memberCount,
    int? virtualUserCount,
    int? sessionType,
  }) {
    return ExploreClub(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      faceUrl: faceUrl ?? this.faceUrl,
      introduction: introduction ?? this.introduction,
      owner: owner ?? this.owner,
      members: members ?? List.from(this.members ?? []),
      memberCount: memberCount ?? this.memberCount,
      virtualUserCount: virtualUserCount ?? this.virtualUserCount,
      sessionType: sessionType ?? this.sessionType,
    );
  }

  factory ExploreClub.fromJson(Map<String, dynamic> json) => ExploreClub(
        groupId: json["groupId"],
        groupName: json["groupName"],
        faceUrl: json["faceUrl"],
        introduction: json["introduction"],
        owner: json["owner"] == null ? null : Member.fromJson(json["owner"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
        memberCount: json["memberCount"],
        virtualUserCount: json["virtualUserCount"],
        sessionType: json["sessionType"],
      );

  Map<String, dynamic> toJson() => {
        "groupId": groupId,
        "groupName": groupName,
        "faceUrl": faceUrl,
        "introduction": introduction,
        "owner": owner?.toJson(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
        "memberCount": memberCount,
        "virtualUserCount": virtualUserCount,
        "sessionType": sessionType,
      };
}

class Member {
  int? userId;
  String? nickname;
  String? faceUrl;
  Location? location;
  int? joinTime;

  Member({
    this.userId,
    this.nickname,
    this.faceUrl,
    this.location,
    this.joinTime,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        userId: json["userId"],
        nickname: json["nickname"],
        faceUrl: json["faceUrl"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        joinTime: json["joinTime"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickname": nickname,
        "faceUrl": faceUrl,
        "location": location?.toJson(),
        "userId": userId,
      };

  String locationString({bool showEarth = false}) {
    if (location != null) {
      // Check if level 1 location name available
      if (location!.name != null && location!.name!.isNotEmpty) {
        return location!.name!;
      } else {
        // Check if level 2 location name available
        if (location!.parent != null &&
            location!.parent!.name != null &&
            location!.parent!.name!.isNotEmpty) {
          return location!.parent!.name!;
        } else {
          // Check if level 3 location name available
          if (location!.parent != null &&
              location!.parent!.parent != null &&
              location!.parent!.parent!.name != null &&
              location!.parent!.parent!.name!.isNotEmpty) {
            return location!.parent!.parent!.name!;
          }
        }
      }
    }
    return showEarth ? StrRes.earth : "";
  }
}
