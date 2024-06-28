// To parse this JSON data, do
//
//     final appUpgradeInfo = appUpgradeInfoFromJson(jsonString);

import 'dart:convert';

AppUpgradeInfo appUpgradeInfoFromJson(String str) =>
    AppUpgradeInfo.fromJson(json.decode(str));

String appUpgradeInfoToJson(AppUpgradeInfo data) => json.encode(data.toJson());

class AppUpgradeInfo {
  bool forceUpdate;
  bool hasUpdate;
  String? updateVersion;

  AppUpgradeInfo({
    required this.forceUpdate,
    required this.hasUpdate,
    required this.updateVersion,
  });

  factory AppUpgradeInfo.fromJson(Map<String, dynamic> json) => AppUpgradeInfo(
        forceUpdate: json["forceUpdate"],
        hasUpdate: json["hasUpdate"],
        updateVersion: json["updateVersion"],
      );

  Map<String, dynamic> toJson() => {
        "forceUpdate": forceUpdate,
        "hasUpdate": hasUpdate,
        "updateVersion": updateVersion,
      };
}
