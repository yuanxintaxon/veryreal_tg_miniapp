import '../../veryreal_common.dart';

class WorkMomentsList {
  List<WorkMoments>? workMoments;
  int? currentPage;
  int? showNumber;

  WorkMomentsList({this.workMoments, this.currentPage, this.showNumber});

  WorkMomentsList.fromJson(Map<String, dynamic> json) {
    if (json['workMoments'] != null) {
      workMoments = <WorkMoments>[];
      json['workMoments'].forEach((v) {
        workMoments!.add(WorkMoments.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    showNumber = json['showNumber'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (workMoments != null) {
      data['workMoments'] = workMoments!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['showNumber'] = showNumber;
    return data;
  }
}

class WorkMoments {
  String? workMomentID;
  String? userID;
  Content? content;
  List<LikeUsers>? likeUsers;
  List<Comments>? comments;
  String? faceURL;
  String? nickname;
  int? gender;
  int? height;
  int? weight;
  int? age;
  String? zodiac;
  Location? location;
  int? vip;
  List<LikeUsers>? atUsers;
  List<LikeUsers>? permissionUsers;
  int? createTime;
  int? permission; // 0：公开 1: 仅自己可见 2：部分可见 3：不给谁看
  int? type; // 1 为你点了赞  2 提到了你   3 评论了你/xx回复xxx

  WorkMoments({
    this.workMomentID,
    this.userID,
    this.content,
    this.likeUsers,
    this.comments,
    this.faceURL,
    this.nickname,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.zodiac,
    this.location,
    this.vip,
    this.atUsers,
    this.permissionUsers,
    this.createTime,
    this.permission,
    this.type,
  });

  WorkMoments.fromJson(Map<String, dynamic> json) {
    workMomentID = json['workMomentID'];
    userID = json['userID'];
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    if (json['likeUsers'] != null) {
      likeUsers = <LikeUsers>[];
      json['likeUsers'].forEach((v) {
        likeUsers!.add(LikeUsers.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    faceURL = json['faceURL'];
    nickname = json['nickname'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    age = json['age'];
    zodiac = json['zodiac'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    vip = json['vip'];
    if (json['atUsers'] != null) {
      atUsers = <LikeUsers>[];
      json['atUsers'].forEach((v) {
        atUsers!.add(LikeUsers.fromJson(v));
      });
    }
    if (json['permissionUsers'] != null) {
      permissionUsers = <LikeUsers>[];
      json['permissionUsers'].forEach((v) {
        permissionUsers!.add(LikeUsers.fromJson(v));
      });
    }
    createTime = json['createTime'];
    permission = json['permission'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['workMomentID'] = workMomentID;
    data['userID'] = userID;
    data['content'] = content?.toJson();
    if (likeUsers != null) {
      data['likeUsers'] = likeUsers!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['faceURL'] = faceURL;
    data['gender'] = gender;
    data['height'] = height;
    data['weight'] = weight;
    data['age'] = age;
    data['zodiac'] = zodiac;
    data['location'] = location?.toJson();
    data['vip'] = vip;
    if (atUsers != null) {
      data['atUsers'] = atUsers!.map((v) => v.toJson()).toList();
    }
    if (permissionUsers != null) {
      data['permissionUsers'] =
          permissionUsers!.map((v) => v.toJson()).toList();
    }
    data['createTime'] = createTime;
    data['permission'] = permission;
    data['type'] = type;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkMoments &&
          runtimeType == other.runtimeType &&
          workMomentID == other.workMomentID;

  @override
  int get hashCode => workMomentID.hashCode;

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

class LikeUsers {
  String? userID;
  String? nickname;
  String? faceURL;
  int? createTime;

  LikeUsers({
    this.userID,
    this.nickname,
    this.faceURL,
    this.createTime,
  });

  LikeUsers.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['createTime'] = createTime;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikeUsers &&
          runtimeType == other.runtimeType &&
          userID == other.userID;

  @override
  int get hashCode => userID.hashCode;
}

class Comments {
  String? commentID;
  String? userID;
  String? nickname;
  String? faceURL;
  String? replyUserID;
  String? replyNickname;
  String? replyFaceURL;
  String? content;
  int? createTime;

  Comments(
      {this.commentID,
      this.userID,
      this.nickname,
      this.faceURL,
      this.replyUserID,
      this.replyNickname,
      this.replyFaceURL,
      this.content,
      this.createTime});

  Comments.fromJson(Map<String, dynamic> json) {
    commentID = json['commentID'];
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    replyUserID = json['replyUserID'];
    replyNickname = json['replyNickname'];
    replyFaceURL = json['replyFaceURL'];
    content = json['content'];
    createTime = json['createTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['commentID'] = commentID;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['replyUserID'] = replyUserID;
    data['replyNickname'] = replyNickname;
    data['replyFaceURL'] = replyFaceURL;
    data['content'] = content;
    data['createTime'] = createTime;
    return data;
  }
}

class Content {
  int? type;
  List<Metas>? metas;
  String? text;

  Content({this.type, this.metas, this.text});

  Content.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['metas'] != null) {
      metas = <Metas>[];
      json['metas'].forEach((v) {
        metas!.add(Metas.fromJson(v));
      });
    }
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (metas != null) {
      data['metas'] = metas!.map((v) => v.toJson()).toList();
    }
    data['text'] = text;
    return data;
  }
}

class Metas {
  String? original;
  String? thumb;

  Metas({this.original, this.thumb});

  Metas.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['original'] = original;
    data['thumb'] = thumb;
    return data;
  }
}

class WorkMomentsNotification {
  WorkMoments? body;
  int? unreadNum;

  WorkMomentsNotification({this.body, this.unreadNum});

  WorkMomentsNotification.fromJson(Map<String, dynamic> json) {
    body = json['body'] == null ? null : WorkMoments.fromJson(json['body']);
    unreadNum = json['unreadNum'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['body'] = body?.toJson();
    data['unreadNum'] = unreadNum;
    return data;
  }
}
