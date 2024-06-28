
import '../../veryreal_common.dart';

/// B端用户信息
class UserFullInfo {
  String? userID;
  String? userType;
  String? password;
  String? account;
  String? phoneNumber;
  String? areaCode;
  String? nickname;
  String? englishName;
  String? faceURL;
  int? gender;
  String? mobileAreaCode;
  String? mobile;
  String? telephone;
  int? level;
  int? birth;
  String? email;
  String? language;
  int? age;
  int? vip;
  int? verified;
  String? zodiac;
  String? igUsername;
  Location? location;
  String? aboutMe;
  String? introVideo;
  int? height;
  String? heightUnit;
  int? weight;
  String? weightUnit;
  int? order;
  int? status;
  int? allowAddFriend;
  int? allowBeep;
  int? allowVibration;
  int? forbidden;
  String? station;
  List<DepartmentInfo>? departmentList;

  bool get isMale => gender == 1;

  UserFullInfo({
    this.userID,
    this.password,
    this.account,
    this.phoneNumber,
    this.areaCode,
    this.nickname,
    this.englishName,
    this.faceURL,
    this.gender,
    this.mobileAreaCode,
    this.mobile,
    this.telephone,
    this.level,
    this.birth,
    this.email,
    this.language,
    this.age,
    this.vip,
    this.verified,
    this.zodiac,
    this.igUsername,
    this.location,
    this.aboutMe,
    this.introVideo,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
    this.order,
    this.status,
    this.allowAddFriend,
    this.allowBeep,
    this.allowVibration,
    this.forbidden,
    this.station,
    this.departmentList,
  });

  UserFullInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userType = json["userType"];
    password = json['password'];
    account = json['account'];
    phoneNumber = json['phoneNumber'];
    areaCode = json['areaCode'];
    nickname = json['nickname'];
    englishName = json['englishName'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    mobileAreaCode = json['mobileAreaCode'];
    mobile = json['mobile'];
    telephone = json['telephone'];
    level = json['level'];
    birth = json['birth'];
    email = json['email'];
    language = json['language'];
    age = json['age'];
    vip = json['vip'];
    verified = json['verified'];
    zodiac = json['zodiac'];
    igUsername = json['igUsername'];
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    aboutMe = json['aboutMe'];
    introVideo = json['introVideo'];
    height = json['height'];
    heightUnit = json['heightUnit'];
    weight = json['weight'];
    weightUnit = json['weightUnit'];
    order = json['order'];
    status = json['status'];
    allowAddFriend = json['allowAddFriend'];
    allowBeep = json['allowBeep'];
    allowVibration = json['allowVibration'];
    forbidden = json['forbidden'];
    station = json['station'];
    departmentList = json['departmentList'] == null
        ? null
        : (json['departmentList'] as List)
            .map((e) => DepartmentInfo.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['userType'] = userType;
    data['password'] = password;
    data['account'] = account;
    data['phoneNumber'] = phoneNumber;
    data['areaCode'] = areaCode;
    data['nickname'] = nickname;
    data['englishName'] = englishName;
    data['faceURL'] = faceURL;
    data['gender'] = gender;
    data['mobileAreaCode'] = mobileAreaCode;
    data['telephone'] = telephone;
    data['level'] = level;
    data['birth'] = birth;
    data['email'] = email;
    data['language'] = language;
    data['age'] = age;
    data['vip'] = vip;
    data['verified'] = verified;
    data['zodiac'] = zodiac;
    data['igUsername'] = igUsername;
    data['location'] = location?.toJson();
    data['aboutMe'] = aboutMe;
    data['introVideo'] = introVideo;
    data['height'] = height;
    data['heightUnit'] = heightUnit;
    data['weight'] = weight;
    data['weightUnit'] = weightUnit;
    data['order'] = order;
    data['status'] = status;
    data['allowAddFriend'] = allowAddFriend;
    data['allowBeep'] = allowBeep;
    data['allowVibration'] = allowVibration;
    data['forbidden'] = forbidden;
    data['station'] = station;
    data['departmentList'] = departmentList?.map((e) => e.toJson()).toList();
    return data;
  }

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

class DepartmentInfo {
  String? departmentID;
  String? departmentFaceURL;
  String? departmentName;
  String? departmentParentID;
  int? departmentOrder;
  int? departmentDepartmentType;
  String? departmentRelatedGroupID;
  int? departmentCreateTime;
  int? memberOrder;
  String? memberPosition;
  int? memberLeader;
  int? memberStatus;
  int? memberEntryTime;
  int? memberTerminationTime;
  int? memberCreateTime;

  DepartmentInfo(
      {this.departmentID,
      this.departmentFaceURL,
      this.departmentName,
      this.departmentParentID,
      this.departmentOrder,
      this.departmentDepartmentType,
      this.departmentRelatedGroupID,
      this.departmentCreateTime,
      this.memberOrder,
      this.memberPosition,
      this.memberLeader,
      this.memberStatus,
      this.memberEntryTime,
      this.memberTerminationTime,
      this.memberCreateTime});

  DepartmentInfo.fromJson(Map<String, dynamic> json) {
    departmentID = json['departmentID'];
    departmentFaceURL = json['departmentFaceURL'];
    departmentName = json['departmentName'];
    departmentParentID = json['departmentParentID'];
    departmentOrder = json['departmentOrder'];
    departmentDepartmentType = json['departmentDepartmentType'];
    departmentRelatedGroupID = json['departmentRelatedGroupID'];
    departmentCreateTime = json['departmentCreateTime'];
    memberOrder = json['memberOrder'];
    memberPosition = json['memberPosition'];
    memberLeader = json['memberLeader'];
    memberStatus = json['memberStatus'];
    memberEntryTime = json['memberEntryTime'];
    memberTerminationTime = json['memberTerminationTime'];
    memberCreateTime = json['memberCreateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['departmentID'] = departmentID;
    data['departmentFaceURL'] = departmentFaceURL;
    data['departmentName'] = departmentName;
    data['departmentParentID'] = departmentParentID;
    data['departmentOrder'] = departmentOrder;
    data['departmentDepartmentType'] = departmentDepartmentType;
    data['departmentRelatedGroupID'] = departmentRelatedGroupID;
    data['departmentCreateTime'] = departmentCreateTime;
    data['memberOrder'] = memberOrder;
    data['memberPosition'] = memberPosition;
    data['memberLeader'] = memberLeader;
    data['memberStatus'] = memberStatus;
    data['memberEntryTime'] = memberEntryTime;
    data['memberTerminationTime'] = memberTerminationTime;
    data['memberCreateTime'] = memberCreateTime;
    return data;
  }
}
