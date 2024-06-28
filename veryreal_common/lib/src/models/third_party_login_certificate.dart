// To parse this JSON data, do
//
//     final thirdPartyLoginCertificate = thirdPartyLoginCertificateFromJson(jsonString);

import 'dart:convert';

import 'login_certificate.dart';

ThirdPartyLoginCertificate thirdPartyLoginCertificateFromJson(String str) =>
    ThirdPartyLoginCertificate.fromJson(json.decode(str));

String thirdPartyLoginCertificateToJson(ThirdPartyLoginCertificate data) =>
    json.encode(data.toJson());

class ThirdPartyLoginCertificate {
  bool passed;
  LoginCertificate? loginResp;
  HalfLoginResp? halfLoginResp;

  ThirdPartyLoginCertificate({
    this.passed = false,
    this.loginResp,
    this.halfLoginResp,
  });

  factory ThirdPartyLoginCertificate.fromJson(Map<String, dynamic> json) =>
      ThirdPartyLoginCertificate(
        passed: json["passed"] ?? false,
        loginResp: json["loginResp"] == null
            ? null
            : LoginCertificate.fromJson(json["loginResp"]),
        halfLoginResp: json["halfLoginResp"] == null
            ? null
            : HalfLoginResp.fromJson(json["halfLoginResp"]),
      );

  Map<String, dynamic> toJson() => {
        "passed": passed,
        "loginResp": loginResp?.toJson(),
        "halfLoginResp": halfLoginResp?.toJson(),
      };
}

class HalfLoginResp {
  String? nickname;
  String? faceUrl;
  String? email;
  String? areaCode;
  String? phoneNumber;

  HalfLoginResp({
    this.nickname,
    this.faceUrl,
    this.email,
    this.areaCode,
    this.phoneNumber,
  });

  factory HalfLoginResp.fromJson(Map<String, dynamic> json) => HalfLoginResp(
        nickname: json["nickname"],
        faceUrl: json["faceURL"],
        email: json["email"],
        areaCode: json["areaCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "nickname": nickname,
        "faceURL": faceUrl,
        "email": email,
        "areaCode": areaCode,
        "phoneNumber": phoneNumber,
      };
}
