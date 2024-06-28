// To parse this JSON data, do
//
//     final groupVirtualUserConfig = groupVirtualUserConfigFromJson(jsonString);

import 'dart:convert';

GroupVirtualUserConfig groupVirtualUserConfigFromJson(String str) =>
    GroupVirtualUserConfig.fromJson(json.decode(str));

String groupVirtualUserConfigToJson(GroupVirtualUserConfig data) =>
    json.encode(data.toJson());

class GroupVirtualUserConfig {
  int? minVirtualUsers;
  int? maxVirtualUsers;

  GroupVirtualUserConfig({
    this.minVirtualUsers,
    this.maxVirtualUsers,
  });

  factory GroupVirtualUserConfig.fromJson(Map<String, dynamic> json) =>
      GroupVirtualUserConfig(
        minVirtualUsers: json["minVirtualUsers"],
        maxVirtualUsers: json["maxVirtualUsers"],
      );

  Map<String, dynamic> toJson() => {
        "minVirtualUsers": minVirtualUsers,
        "maxVirtualUsers": maxVirtualUsers,
      };
}
